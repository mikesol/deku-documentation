module Run where

import Prelude

import Components.App (app)
import Components.Link (link, linkWithString, linkWithNut)
import Components.PageToContent (pageToContent)
import Contracts (EffectWithCancellers, Env(..), Page, contentToPoll)
import Control.Monad.Free (foldFree)
import Control.Monad.ST.Class (liftST)
import Control.Monad.Writer (runWriterT)
import Control.Plus (empty)
import DarkModePreference (OnDark(..), OnLight(..), darkModeListener, prefersDarkMode)
import Data.Either (either)
import Data.Foldable (traverse_)
import Data.Generic.Rep (class Generic)
import Data.Map as Map
import Data.Maybe (Maybe(..), maybe)
import Data.Show.Generic (genericShow)
import Data.Tuple (Tuple(..), fst, snd)
import Deku.Core (Nut)
import Deku.Effect (useMailboxed, useMailboxed', useState, useState')
import Deku.Toplevel (SSROutput, hydrateInBody, ssrInBody)
import Effect (Effect)
import Effect.Exception (throw)
import Effect.Ref (Ref)
import Effect.Ref as Ref
import FRP.Dedup (dedup)
import FRP.Event (Event, fold, mailbox, subscribe)
import FRP.Poll (Poll, listen_)
import Foreign (Foreign)
import Router.ADT (Route(..))
import Router.Page (routeToPage)
import Web.DOM.Element (getBoundingClientRect)
import Web.DOM.Element as Web.DOM
import Web.Event.Event (EventType(..))
import Web.Event.EventTarget (addEventListener, eventListener, removeEventListener)
import Web.HTML (window)
import Web.HTML.Window (toEventTarget)
import Yoga.JSON (writeImpl, read)

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
  -> Effect { event :: a -> Event b, unsubscribe :: Effect Unit }
boxMe e = do
  { push, event } <- liftST mailbox
  unsubscribe <- subscribe e push
  pure { event, unsubscribe }

pageToPollWithCancellers
  :: (Tuple Int Web.DOM.Element -> Effect Unit)
  -> Page
  -> EffectWithCancellers Nut
pageToPollWithCancellers rightSideNavPush = runWriterT
  <<< foldFree (contentToPoll env)
  <<< pageToContent rightSideNavPush

-- env used to be necessary when routing needed to be intercepted by
-- the framework. as it's taken care of by vike now, this is
-- no longer necessary to pass down from the top level
-- it can be safely refactored to be constant functions, ie
-- routeLink r = link r empty
env :: Env
env = Env
  { routeLink: \r -> link r empty
  , routeLinkWithText: \r s -> linkWithString r s empty
  , routeLinkWithNuts: \r s -> linkWithNut r s empty
  }

makeRouting
  :: { cancelMe :: Ref (Effect Unit)
     , getCurrentRoute ::
         { nut :: Nut
         , page :: Page
         , route :: Route
         }
         -> Effect
              ( Tuple
                  ( { nut :: Nut
                    , page :: Page
                    , route :: Route
                    }
                    -> Effect Unit
                  )
                  ( Poll
                      { nut :: Nut
                      , page :: Page
                      , route :: Route
                      }
                  )
              )
     , getCurrentRouteMailbox ::
         { address :: Route, payload :: Unit }
         -> Effect
              ( Tuple
                  ( { address :: Route
                    , payload :: Unit
                    }
                    -> Effect Unit
                  )
                  (Route -> Poll Unit)
              )
     , getPrevRouteMailbox ::
         Effect
           ( Tuple
               ( { address :: Route
                 , payload :: Unit
                 }
                 -> Effect Unit
               )
               (Route -> Poll Unit)
           )
     , getRightSideNav ::
         Maybe (Tuple Int Web.DOM.Element)
         -> Effect
              ( Tuple (Maybe (Tuple Int Web.DOM.Element) -> Effect Unit)
                  (Poll (Maybe (Tuple Int Web.DOM.Element)))
              )
     , prevRouteRef :: Ref (Maybe Route)
     }
  -> Route
  -> Effect
       { currentRoute ::
           Tuple
             ( { nut :: Nut
               , page :: Page
               , route :: Route
               }
               -> Effect Unit
             )
             ( Poll
                 { nut :: Nut
                 , page :: Page
                 , route :: Route
                 }
             )
       , currentRouteMailbox ::
           Tuple
             ( { address :: Route
               , payload :: Unit
               }
               -> Effect Unit
             )
             (Route -> Poll Unit)
       , prevRouteMailbox ::
           Tuple
             ( { address :: Route
               , payload :: Unit
               }
               -> Effect Unit
             )
             (Route -> Poll Unit)
       , rightSideNav ::
           Tuple (Maybe (Tuple Int Web.DOM.Element) -> Effect Unit)
             (Poll (Maybe (Tuple Int Web.DOM.Element)))
       }
makeRouting
  { cancelMe
  , getRightSideNav
  , getCurrentRouteMailbox
  , prevRouteRef
  , getPrevRouteMailbox
  , getCurrentRoute
  }
  new = do
  join $ Ref.read cancelMe
  rightSideNav <- getRightSideNav Nothing
  currentRouteMailbox <- getCurrentRouteMailbox { address: new, payload: unit }
  prevRouteMailbox <- getPrevRouteMailbox
  Ref.write (Just new) prevRouteRef
  let page = routeToPage new
  Tuple nut toCancel <- pageToPollWithCancellers
    (Just >>> fst rightSideNav)
    page
  Ref.write toCancel cancelMe
  currentRoute <- getCurrentRoute { route: new, page, nut }
  pure { rightSideNav, currentRouteMailbox, prevRouteMailbox, currentRoute }

run
  :: forall a
   . (Nut -> Effect a)
  -> Route
  -> Effect { out :: a, routing :: Route -> Effect Unit }
run cont initialRoute = do
  clickedSection <- Ref.new Nothing
  headerElement <- useState'
  rightSideNavSelectE <- useMailboxed'
  prevRightSideNavSelectE <- useMailboxed'
  pdm <- prefersDarkMode
  darkModePreferenceE <- useState pdm
  initialListener <- eventListener (\_ -> pure unit)
  scrollListenerRef <- Ref.new initialListener
  cancelMe <- Ref.new (pure unit)
  prevRouteRef <- Ref.new Nothing
  { currentRouteMailbox, prevRouteMailbox, currentRoute, rightSideNav } <-
    makeRouting
      { cancelMe
      , getCurrentRoute: useState
      , getCurrentRouteMailbox: useMailboxed
      , getPrevRouteMailbox: useMailboxed'
      , getRightSideNav: useState
      , prevRouteRef
      }
      initialRoute
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
  void $ listen_
    ( { header: _, mapOfElts: _ }
        <$> snd headerElement
        <*> fold makeMap
          Map.empty
          (snd rightSideNav)
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
        fst prevRightSideNavSelectE { address: wasHere, payload: unit }
        fst rightSideNavSelectE { address: goHere, payload: unit }
      changeListener newListener
  let pageWas = snd prevRouteMailbox
  let pageIs = snd currentRouteMailbox
  let rightSideNavSelect = snd rightSideNavSelectE
  let rightSideNavDeselect = snd prevRightSideNavSelectE
  void $ darkModeListener
    (OnDark (fst darkModePreferenceE true))
    (OnLight (fst darkModePreferenceE false))
  out <- cont do
    app
      { pageIs
      , pageWas
      , rightSideNavSelect
      , rightSideNavDeselect
      , curPage: _.page <$> snd currentRoute
      , curNut: _.nut <$> snd currentRoute
      , showBanner: dedup
          (_.route >>> eq GettingStarted <$> snd currentRoute)
      , setHeaderElement: fst headerElement
      , clickedSection
      , darkModePreference: snd darkModePreferenceE
      , env
      }
  let
    routing = void <<< makeRouting
      { cancelMe
      , getCurrentRoute: (<<<) <$> (<$) <*> fst $ currentRoute
      , getCurrentRouteMailbox: (<<<) <$> (<$) <*> fst $ currentRouteMailbox
      , getPrevRouteMailbox: prevRouteMailbox <$ do
          Ref.read prevRouteRef >>=
            (traverse_ (fst prevRouteMailbox <<< { address: _, payload: unit }))
      , getRightSideNav: (<<<) <$> (<$) <*> fst $ rightSideNav
      , prevRouteRef
      }
  pure { routing, out }

ssr :: Route -> Effect Foreign
ssr route = do
  { out } <- run ssrInBody route
  pure $ writeImpl out

hydrate
  :: Foreign
  -> Route
  -> Effect { routing :: Route -> Effect Unit, out :: Effect Unit }
hydrate json route = do
  parsed :: SSROutput <- either (throw <<< show) pure $ read json
  run (hydrateInBody parsed) route
