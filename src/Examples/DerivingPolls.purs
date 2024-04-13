module Examples.DerivingPolls where

import Prelude

import Data.Array (drop, length, null)
import Data.Foldable (sum)
import Data.Int (toNumber)
import Data.Number (isNaN)
import Data.Time.Duration (Seconds(..))
import Data.Tuple.Nested ((/\))
import Deku.DOM.Attributes as DA
import Deku.Control (text)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useRef, useState')
import Deku.DOM.Listeners as DL
import Deku.Toplevel (runInBody)
import Effect (Effect)
import ExampleAssitant (ExampleSignature)
import FRP.Event (fold)
import FRP.Event.AnimationFrame (animationFrame')
import FRP.Poll (derivative', sample_, sham)

app :: ExampleSignature
app runExample = do
  af <- animationFrame'
  runExample Deku.do
    setNumber /\ number <- useState'
    nref <- useRef 0.5 number
    let
      average l
        | null l = 0.0
        | otherwise = sum l / (toNumber $ length l)
      unNaN n = if isNaN n then 0.0 else n
    D.div_
      [ D.div_
          [ D.input
              [ DA.xtypeRange
              , DL.numberOn_ DL.input setNumber
              , DA.klass_ "w-full"
              , DA.min_ "0.0"
              , DA.max_ "1.0"
              , DA.step_ "0.01"
              , DA.value_ "0.5"
              ]
              []
          ]
      , D.div_
          [ text
              ( sham
                  ( average >>> unNaN >>> show <$>
                      ( fold
                          ( \b a ->
                              if length b < 10 then b <> [ a ]
                              else (drop 1 b) <> [ a ]
                          )
                          []
                          ( sample_
                              ( derivative'
                                  (?hole <#> (\(Seconds s) -> s))
                                  (effectToPoll nref)
                              )
                              af.event
                          )
                      )
                  )
              )
          ]
      ]

main :: Effect Unit
main = void $ app $ map pure runInBody