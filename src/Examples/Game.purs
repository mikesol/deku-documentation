module Examples.Game where

import Prelude

import Control.Alt ((<|>))
import Control.Monad.ST (ST)
import Control.Monad.ST.Class (liftST)
import Control.Monad.ST.Global (Global)
import Control.Monad.ST.Ref (new, read, write)
import Data.Array (drop, take, dropEnd, zipWith)
import Data.Array as Array
import Data.Exists (Exists, mkExists, runExists)
import Data.Foldable (oneOf, sum)
import Data.Int (toNumber)
import Data.JSDate (getTime, now)
import Data.Maybe (Maybe(..), isJust, maybe)
import Data.Number (sign)
import Data.Number.Format (fixed, toStringWith)
import Data.Tuple (Tuple(..))
import Data.Tuple.Nested ((/\))
import Deku.Control (text, text_)
import Deku.Core (Nut)
import Deku.DOM as D
import Deku.DOM.Attributes as DA
import Deku.DOM.Listeners as DL
import Deku.DOM.SVG as DS
import Deku.DOM.SVG.Attributes as DSA
import Deku.Do as Deku
import Deku.Effect as DE
import Deku.Hooks (guardWith, useDynAtEnd, useHot, useState)
import Deku.Toplevel (runInBody')
import Effect (Effect)
import Effect.Random (randomBool, randomRange)
import ExampleAssitant (ExampleSignature)
import FRP.Event (Event, bindToEffect, bindToST, fold, mapAccum, subscribe, thankTheDriver)
import FRP.Event.AnimationFrame (animationFrame)
import FRP.Event.Time (interval)
import FRP.Poll (Poll, dredge, sham)

buttonClass =
  """inline-flex items-center rounded-md
border border-transparent bg-indigo-600 px-3 py-2
text-sm font-medium leading-4 text-white shadow-sm
hover:bg-indigo-700 focus:outline-none focus:ring-2
focus:ring-indigo-500 focus:ring-offset-2 mr-6""" :: String

newtype ActorF a = ActorF
  { beginPlay :: Effect a
  , tick :: a -> Effect a
  }

type Actor = Exists ActorF

sprite
  :: { setRadius :: Number -> Effect Unit
     , setPositionX :: Number -> Effect Unit
     , setPositionY :: Number -> Effect Unit
     , setFill :: String -> Effect Unit
     , isClicked :: Effect Boolean
     , startDieHappy :: Effect Unit
     , dieHappy :: Effect Unit
     , startDieSad :: Effect Unit
     , dieSad :: Effect Unit
     , bounds :: Number
     }
  -> Actor
sprite
  { setRadius
  , setPositionX
  , setPositionY
  , setFill
  , isClicked
  , startDieHappy
  , startDieSad
  , dieHappy
  , dieSad
  , bounds
  } =
  mkExists $
    ActorF
      { beginPlay: do
          diameter <- randomRange (min bounds 40.0) (min bounds 100.0)
          time <- getTime >>> (_ / 1000.0) <$> now
          lifespan <- randomRange 3.0 9.0
          let radius = diameter / 2.0
          setRadius radius
          let
            randPos = randomRange (radius + 1.0)
              (bounds - radius - 1.0)
          positionX <- randPos
          positionY <- randPos
          setPositionX positionX
          setPositionY positionY
          let
            randVel = mul <$> randomRange 4.0 40.0 <*>
              ((if _ then 1.0 else -1.0) <$> randomBool)
          velocityX <- randVel
          velocityY <- randVel
          pure
            { positionX
            , positionY
            , dyingHappy: Nothing
            , dyingSad: Nothing
            , dead: Nothing
            , diameter
            , radius
            , velocityX
            , velocityY
            , time
            , startingTime: time
            , lifespan
            }
      , tick: \i -> do
          let
            wither d t = do
              time <- getTime >>> (_ / 1000.0) <$> now
              setRadius $ max 0.0 (i.radius * (1.0 - ((time - t) * 2.0)))
              if time - t > 0.5 then do
                setRadius 0.0
                d
                pure $ i { dead = Just time }
              else pure i
          if isJust i.dead then pure i
          else case i.dyingHappy, i.dyingSad of
            Just x, _ -> wither dieHappy x
            _, Just x -> wither dieSad x
            _, _ -> do
              time <- getTime >>> (_ / 1000.0) <$> now
              ifM isClicked
                ( do
                    setFill "fill-green-500"
                    startDieHappy $> i { dyingHappy = Just time }
                )
                do
                  let dTime = time - i.time
                  let span = time - i.startingTime
                  if span > i.lifespan then do
                    setFill "fill-red-500"
                    startDieSad $> i { dyingSad = Just time }
                  else do
                    let
                      posAndVel p v = do
                        let np = dTime * v + p
                        if np < 0.0 || np > bounds then do
                          nv <- mul (-1.0 * sign np) <$> randomRange 4.0 40.0
                          posAndVel p nv
                        else
                          pure (Tuple np v)
                    Tuple positionX velocityX <- posAndVel i.positionX
                      i.velocityX
                    Tuple positionY velocityY <- posAndVel i.positionY
                      i.velocityY
                    setPositionX positionX
                    setPositionY positionY
                    pure $ i
                      { time = time
                      , positionX = positionX
                      , positionY = positionY
                      , velocityX = velocityX
                      , velocityY = velocityY
                      }
      }

mean :: Array Number -> Number
mean ar =
  let
    alen = Array.length ar
  in
    if alen == 0 then 0.0
    else (sum ar) / (toNumber alen)

meanDiff :: Array Number -> Number
meanDiff ar = mean $ zipWith (\a b -> 1.0 / ((a - b) / 1000.0)) (dropEnd 1 ar) (drop 1 ar)

app :: ExampleSignature
app runExample = do
  unsub <- liftST $ new (pure unit)
  let quit = join (liftST $ read unsub)
  append <$> pure quit <*> runExample Deku.do
    setGameStarted /\ gameStarted <- useHot Nothing
    setScoreBudge /\ scoreBudge <- useState $ Just true
    let
      score = fold (\a b -> maybe 0 ((if _ then 1 else (-1)) >>> add a) b)
        0
        scoreBudge
    D.div_
      [ D.div_
          [ D.button
              [ DA.klass_ buttonClass
              , DL.runOn DL.click $ gameStarted <#> \s -> do
                  if isJust s then do
                    join (liftST $ read unsub)
                    void $ liftST $ write (pure unit) unsub
                    setGameStarted Nothing
                    setScoreBudge Nothing
                  else do
                    i <- interval 400
                    a <- animationFrame
                    void $ liftST $ write (i.unsubscribe *> a.unsubscribe) unsub
                    setGameStarted (Just (Tuple a.event i.event))
              ]
              [ text $ gameStarted <#> isJust >>>
                  if _ then "Quit" else "Start Game"
              ]
          , guardWith gameStarted \(Tuple animate _) -> do
              D.div_
                [ text_ "Score: "
                , text $ show <$> score
                , text_ " FPS: "
                , text $ toStringWith (fixed 2) <$>
                    ( sham $ mapAccum
                        (\a b -> Tuple (take 10 ([ b ] <> a)) (meanDiff a))
                        []
                        (bindToEffect animate (const $ getTime <$> now))
                    )
                ]
          ]
      , guardWith gameStarted \(Tuple animate emitter) -> DS.svg
          [ DSA.viewBox_ "0 0 1000 1000", DSA.width_ "400", DSA.height_ "400" ]
          [ Deku.do
              { value } <- useDynAtEnd $ wrangleNut $
                oneOf [ pure unit, sham emitter $> unit ] $> makeFreshSprite
                  1000.0
                  (setScoreBudge $ Just true)
                  (setScoreBudge $ Just false)
                  animate
              value
          ]
      ]
  where
  wrangleNut :: Poll (ST Global (Tuple (Effect Unit) Nut)) -> Poll Nut
  wrangleNut = dredge (thankTheDriver <<< flip bindToST identity)

  makeFreshSprite
    :: Number
    -> Effect Unit
    -> Effect Unit
    -> Event Unit
    -> ST Global (Tuple (Effect Unit) Nut)
  makeFreshSprite bounds startDieHappy startDieSad animate = do
    setRadius /\ diameter <- DE.useState'
    setPositionX /\ positionX <- DE.useState'
    setPositionY /\ positionY <- DE.useState'
    setFill /\ fill <- DE.useState'
    clicked <- new false
    disappear <- new (pure unit)
    let isClicked = liftST $ read clicked
    let setClicked = void $ liftST $ write true clicked
    let dieHappy = liftST (join (read disappear))
    let dieSad = dieHappy
    pure $ Tuple
      ( (liftST <<< void <<< flip write disappear) =<< runExists
          ( \(ActorF { beginPlay, tick }) -> do
              spriteData <- beginPlay >>= liftST <<< new
              liftST $ subscribe animate $ \_ -> do
                spriteData' <- tick =<< liftST (read spriteData)
                void $ liftST $ write spriteData' spriteData
          )
          ( sprite
              { setRadius
              , setPositionX
              , setPositionY
              , setFill
              , isClicked
              , dieHappy
              , dieSad
              , startDieHappy
              , startDieSad
              , bounds
              }
          )
      )
      ( DS.circle
          [ DL.click_ \_ -> setClicked
          , DSA.cx $ show <$> positionX
          , DSA.cy $ show <$> positionY
          , DSA.r $ show <$> diameter
          , DSA.klass (pure "fill-blue-500" <|> fill)
          ]
          []
      )

main :: Effect Unit
main = void $ app (map (map void) runInBody')