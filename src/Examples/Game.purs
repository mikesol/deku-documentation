module Examples.Game where

import Prelude

import Control.Alt ((<|>))
import Control.Monad.ST.Class (liftST)
import Control.Monad.ST.Ref (new, read, write)
import Data.Array (drop, take, dropEnd, zipWith)
import Data.Array as Array
import Data.Compactable (compact)
import Data.DateTime.Instant (Instant, unInstant)
import Data.Either (Either(..), either)
import Data.Foldable (sum)
import Data.Int (round, toNumber)
import Data.Maybe (Maybe(..), isJust, maybe)
import Data.Newtype (unwrap)
import Data.Number (floor, sign)
import Data.Number.Format (fixed, toStringWith)
import Data.Op (Op(..))
import Data.Tuple (Tuple(..))
import Data.Tuple.Nested ((/\))
import Deku.Control (text, text_)
import Deku.Core (Nut, useRant)
import Deku.DOM as D
import Deku.DOM.Attributes as DA
import Deku.DOM.Listeners as DL
import Deku.DOM.SVG as DS
import Deku.DOM.SVG.Attributes as DSA
import Deku.Do as Deku
import Deku.Hooks (guardWith, useDynAtEnd, useHot, useState)
import Deku.Toplevel (runInBody)
import Effect (Effect)
import Effect.Random (randomBool, randomRange)
import Effect.Timer (clearTimeout)
import ExampleAssitant (ExampleSignature)
import FRP.Event (Event, fold, mapAccum, sampleOnRight)
import FRP.Event.AnimationFrame (animationFrame')
import FRP.Event.Time (interval', withDelay, withTime)
import FRP.Poll (sham)
import Record (union)

buttonClass =
  """inline-flex items-center rounded-md
border border-transparent bg-indigo-600 px-3 py-2
text-sm font-medium leading-4 text-white shadow-sm
hover:bg-indigo-700 focus:outline-none focus:ring-2
focus:ring-indigo-500 focus:ring-offset-2 mr-6""" :: String

type SpriteInit' =
  ( positionX :: Number
  , positionY :: Number
  , diameter :: Number
  , velocityX :: Number
  , velocityY :: Number
  , startingTime :: Number
  , lifespan :: Number
  , bounds :: Number
  )

type SpriteInit =
  { canceller :: Effect Unit
  | SpriteInit'
  }

type SpriteEnv = { time :: Number }

type SpriteInfo =
  { bounds :: Number
  , positionX :: Number
  , positionY :: Number
  , dying :: Maybe (Either Number Number)
  , dead :: Maybe Number
  , isClicked :: Boolean
  , diameter :: Number
  , velocityX :: Number
  , velocityY :: Number
  , startingTime :: Number
  , lifespan :: Number
  , time :: Number
  }

withSpriteDelay
  :: Effect Unit
  -> Op (Effect Unit) SpriteInit
  -> Op (Effect Unit) { | SpriteInit' }
withSpriteDelay scoreDown (Op f) = Op \i -> do
  -- change
  let
    Op wd = withDelay (round (i.lifespan * 1000.0)) $ Op case _ of
      Left tid -> f (i `union` { canceller: clearTimeout tid })
      Right _ -> scoreDown
  wd unit

withSpriteInit
  :: Number -> Op (Effect Unit) { | SpriteInit' } -> Op (Effect Unit) Instant
withSpriteInit bounds (Op f) = Op \i -> do
  diameter <- randomRange (min bounds 40.0) (min bounds 100.0)
  lifespan <- randomRange 3.0 9.0
  let radius = diameter / 2.0
  let
    randPos = randomRange (radius + 1.0)
      (bounds - radius - 1.0)
  positionX <- randPos
  positionY <- randPos
  let
    randVel = mul <$> randomRange 4.0 40.0 <*>
      ((if _ then 1.0 else -1.0) <$> randomBool)
  velocityX <- randVel
  velocityY <- randVel
  let startingTime = (unwrap $ unInstant i) / 1000.0
  f
    { positionX
    , positionY
    , diameter
    , velocityX
    , velocityY
    , startingTime
    , lifespan
    , bounds
    }

beginPlay :: SpriteInit -> SpriteInfo
beginPlay
  { positionX
  , positionY
  , diameter
  , velocityX
  , velocityY
  , startingTime
  , lifespan
  , bounds
  } = do
  let
    time = startingTime
  { positionX
  , positionY
  , isClicked: false
  , dying: Nothing
  , dead: Nothing
  , diameter
  , velocityX
  , velocityY
  , time
  , startingTime: time
  , lifespan
  , bounds
  }

logisticMap :: Number -> Number
logisticMap x = 3.99 * x * (1.0 - x)

tick :: SpriteEnv -> SpriteInfo -> SpriteInfo
tick env i' = do
  let
    i = i' { time = env.time }
    wither t = do
      if env.time - t > 0.5 then do
        i { dead = Just env.time, diameter = 0.0 }
      else
        i { diameter = max 0.0 (i.diameter * (1.0 - ((env.time - t) * 2.0))) }
  if isJust i.dead then i
  else case i.dying of
    Just (Left x) -> wither x
    Just (Right x) -> wither x
    _ -> do
      if i.isClicked then i { dying = Just (Right env.time) }
      else do
        let dTime = env.time - i'.time
        let span = env.time - i.startingTime
        if span > i.lifespan then do
          i { dying = Just $ Left env.time }
        else do
          let
            posAndVel p v r = do
              let np = dTime * v + p
              if np < 0.0 || np > i.bounds then do
                let nv = (-1.0 * sign np) * r * 36.0 + 4.0
                posAndVel p nv (logisticMap r)
              else
                Tuple np v
            rx = env.time - floor env.time
            ry = 1.0 - rx
            Tuple positionX velocityX = posAndVel i.positionX
              i.velocityX
              rx
            Tuple positionY velocityY = posAndVel i.positionY
              i.velocityY
              ry
          i
            { positionX = positionX
            , positionY = positionY
            , velocityX = velocityX
            , velocityY = velocityY
            }

mean :: Array Number -> Number
mean ar =
  let
    alen = Array.length ar
  in
    if alen == 0 then 0.0
    else (sum ar) / (toNumber alen)

meanDiff :: Array Number -> Number
meanDiff ar = mean $ zipWith (\a b -> 1.0 / ((a - b) / 1000.0)) (dropEnd 1 ar)
  (drop 1 ar)

app :: ExampleSignature
app runExample = do
  let bounds = 1000
  unsub <- liftST $ new (pure unit)
  af <- animationFrame' withTime
  let quit = join (liftST $ read unsub) *> af.unsubscribe
  append <$> pure quit <*> runExample Deku.do
    setGameStarted /\ gameStarted <- useHot Nothing
    setScoreBudge /\ scoreBudge <- useState $ Nothing
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
                    i <- interval'
                      ( withSpriteDelay (setScoreBudge $ Just false) >>>
                          (withSpriteInit (toNumber bounds))
                      )
                      400
                    void $ liftST $ write i.unsubscribe unsub
                    setGameStarted (Just i.event)
              ]
              [ text $ gameStarted <#> isJust >>>
                  if _ then "Quit" else "Start Game"
              ]
          , guardWith gameStarted \_ -> do
              D.div_
                [ text_ "Score: "
                , text $ show <$> score
                , text_ " FPS: "
                , text $ toStringWith (fixed 2) <$>
                    ( sham $ mapAccum
                        (\a b -> Tuple (take 10 ([ b ] <> a)) (meanDiff a))
                        []
                        (map (_.time >>> unInstant >>> unwrap) af.event)
                    )
                ]
          ]
      , guardWith gameStarted \emitter -> DS.svg
          [ DSA.viewBox_ $ "0 0 " <> show bounds <> " " <> show bounds
          , DSA.width_ "400"
          , DSA.height_ "400"
          ]
          [ Deku.do
              { value } <- useDynAtEnd
                ( sham emitter <#> makeFreshSprite (setScoreBudge (Just true))
                    (af.event <#> _.time)
                )
              value
          ]
      ]
  where

  makeFreshSprite
    :: Effect Unit
    -> Event Instant
    -> SpriteInit
    -> Nut
  makeFreshSprite scoreUp animate si = Deku.do
    setClicked /\ clicked <- useState false
    let bp = beginPlay si
    ticked <- useRant $
      mapAccum
        (\a (Tuple time clk) -> Tuple (tick { time } (a { isClicked = clk })) a)
        bp
        ( sampleOnRight clicked
            (Tuple <$> (sham animate <#> unInstant >>> unwrap >>> (_ / 1000.0)))
        )
    DS.circle
      [ DL.click_ \_ -> do
          setClicked true
          si.canceller
          scoreUp
      , DSA.cx $ _.positionX >>> show <$> ticked
      , DSA.cy $ _.positionY >>> show <$> ticked
      , DSA.r $ _.diameter >>> (_ / 2.0) >>> show <$> ticked
      , DSA.klass
          ( pure "fill-blue-500" <|>
              ( map (either (const "fill-red-500") (const "fill-green-500"))
                  $ compact
                  $ (_.dying <$> ticked)
              )
          )
      ]
      []

main :: Effect Unit
main = void $ app runInBody