module Main
  ( ScrolledSection(..)
  , getScrolledSection
  , main
  ) where

import Prelude

import Components.App (app)
import Control.Alt ((<|>))
import Control.Monad.ST (ST)
import Control.Monad.ST.Class (liftST)
import Control.Monad.ST.Global (Global)
import DarkModePreference (OnDark(..), OnLight(..), darkModeListener, prefersDarkMode)
import Data.Compactable (compact)
import Data.Foldable (traverse_)
import Data.Generic.Rep (class Generic)
import Data.Map as Map
import Data.Maybe (Maybe(..), maybe)
import Data.Show.Generic (genericShow)
import Data.Tuple (Tuple(..), curry, fst, snd, uncurry)
import Deku.Toplevel (runInBody)
import Effect (Effect)
import Effect.Class.Console (logShow)
import Effect.Ref as Ref
import FRP.Dedup (dedup)
import FRP.Event (Event, create, fold, mailbox, subscribe)
import FRP.Lag (lag)
import FRP.Poll (sham)
import Router.ADT (Route(..))
import Router.Page (routeToPage)
import Router.Route (route)
import Routing.Duplex (parse)
import Routing.PushState (makeInterface, matchesWith)
import Web.DOM.Element (getBoundingClientRect)
import Web.Event.Event (EventType(..))
import Web.Event.EventTarget (addEventListener, eventListener, removeEventListener)
import Web.HTML (window)
import Web.HTML.Window (toEventTarget)

pixelBufferForScroll = 100.0 :: Number

data ScrolledSection
  = ScrolledCandidate Int
  | ScrolledDefinite Int
  | NotScrolled

data ScrollCheckDirection = ScrollCheckStart | ScrollCheckDown | ScrollCheckUp

derive instance Generic ScrolledSection _
instance Show ScrolledSection where
  show = genericShow

-- it's impossible to prevent this function from entering into an infinite loop
-- so the best we can do is cap it at a reasonable level
-- it seems like it will never go beyond 3 iterations, so we'll set 7 as the upper bound
getScrolledSection :: Int -> (Int -> Effect ScrolledSection) -> Effect Int
getScrolledSection startingAt f = go 0 ScrollCheckStart startingAt startingAt
  where
  go rc checkDir n head = case rc of
    7 -> {-Log.error "Infinite loop, ping Mike." *>-}  pure 0
    _ -> do
      scrolledSection <- f head
      case scrolledSection of
        ScrolledDefinite i -> pure i
        ScrolledCandidate i -> case checkDir of
          ScrollCheckDown -> pure i
          _ -> go (rc + 1) ScrollCheckUp i (i + 1)
        NotScrolled ->
          if n == 0 then pure 0
          else case checkDir of
            ScrollCheckUp -> pure n
            _ -> go (rc + 1) ScrollCheckDown n (head - 1)

boxMe
  :: forall a b
   . Ord a
  => Event { address :: a, payload :: b }
  -> ST Global { event :: a -> Event b, unsubscribe :: ST Global Unit }
boxMe e = do
  { push, event } <- mailbox
  unsubscribe <- subscribe e push
  pure { event, unsubscribe }

memoizeMe
  :: forall a
   . Event a
  -> ST Global { event :: Event a, unsubscribe :: ST Global Unit }
memoizeMe e = do
  { push, event } <- create
  unsubscribe <- subscribe e push
  pure { event, unsubscribe }

main :: Effect Unit
main = do
  clickedSection <- Ref.new Nothing
  currentRouteMailbox <- liftST create
  previousRouteMailbox <- liftST create
  currentRoute <- liftST create
  headerElement <- liftST create
  rightSideNav <- liftST create
  rightSideNavSelectE <- liftST create
  darkModePreferenceE <- liftST create
  psi <- makeInterface
  initialListener <- eventListener (\_ -> pure unit)
  scrollListenerRef <- Ref.new initialListener
  let scrollType = EventType "scroll"
  let
    removeScroll oldListener = toEventTarget <$> window >>= removeEventListener
      scrollType
      oldListener
      true
  let
    setScroll newListener = toEventTarget <$> window >>= addEventListener
      scrollType
      newListener
      true
  setScroll initialListener
  let
    changeListener newListener = do
      oldListener <- Ref.read scrollListenerRef
      removeScroll oldListener
      setScroll newListener
      Ref.write newListener scrollListenerRef

  let
    makeMap inMap = case _ of
      Nothing -> Map.empty
      Just (Tuple key val) -> Map.insert key val inMap
  void $ liftST $ subscribe
    ( { header: _, mapOfElts: _ }
        <$> headerElement.event
        <*> fold makeMap
          Map.empty
          rightSideNav.event
    )
    \{ header, mapOfElts } -> do
      currentSectionRef <- Ref.new 0
      newListener <- eventListener \_ -> do
        let
          toVerify ce =
            Map.lookup ce mapOfElts # maybe (pure NotScrolled) \myElt -> do
              boundingRectHeader <- getBoundingClientRect header
              boundingRectElt <- getBoundingClientRect myElt
              let
                minAy = boundingRectHeader.top
                maxAy = boundingRectHeader.bottom
                minBy = boundingRectElt.top - pixelBufferForScroll
                maxBy = boundingRectElt.bottom - pixelBufferForScroll
                aAboveB = minAy > maxBy
                aBelowB = maxAy < minBy

                intersects = not (aAboveB || aBelowB)
              pure case intersects of
                true -> ScrolledDefinite ce
                false ->
                  if maxBy < minAy then ScrolledCandidate ce else NotScrolled
        wasHere <- Ref.read currentSectionRef
        goHere <- Ref.read clickedSection >>= case _ of
          Just goHere -> do
            Ref.write Nothing clickedSection
            pure goHere
          Nothing -> getScrolledSection wasHere toVerify
        Ref.write goHere currentSectionRef
        logShow { goHere }
        rightSideNavSelectE.push goHere
      changeListener newListener
  rightSideLagged <- liftST $ memoizeMe (lag (dedup rightSideNavSelectE.event))
  pageWas <- liftST $ boxMe
    ({ address: _, payload: unit } <$> previousRouteMailbox.event)
  pageIs <- liftST $ boxMe
    ({ address: _, payload: unit } <$> currentRouteMailbox.event)
  rightSideNavSelect <- liftST $ boxMe
    ({ address: _, payload: unit } <$> (snd <$> rightSideLagged.event))
  rightSideNavDeselect <- liftST $ boxMe
    ({ address: _, payload: unit } <$> compact (fst <$> rightSideLagged.event))
  runInBody
    ( Deku.do

        app
          { pageIs: map sham pageIs.event
          , pageWas: map sham pageWas.event
          , rightSideNavSelect: map sham rightSideNavSelect.event
          , rightSideNavDeselect: map sham rightSideNavDeselect.event
          , pushState: psi.pushState
          , curPage: sham $ routeToPage <$> currentRoute.event
          , showBanner: dedup (eq GettingStarted <$> sham currentRoute.event)
          , setHeaderElement: headerElement.push
          , setRightSideNav: Just >>> rightSideNav.push
          , clickedSection
          , darkModePreference: sham darkModePreferenceE.event
          }
    )
  dedupRoute <- liftST $ create
  void $ liftST $ subscribe (dedup dedupRoute.event) $ uncurry \old new -> do
    rightSideNav.push Nothing
    traverse_ previousRouteMailbox.push old
    currentRouteMailbox.push new
    currentRoute.push new
  void $ matchesWith (map (\e -> e <|> pure FourOhFour) (parse route))
    (curry dedupRoute.push)
    psi
  prefersDarkMode >>= darkModePreferenceE.push
  void $ darkModeListener
    (OnDark (darkModePreferenceE.push true))
    (OnLight (darkModePreferenceE.push false))