module Examples.IntegratingPolls where

import Prelude

import Data.Time.Duration (Seconds(..))
import Data.Tuple.Nested ((/\))
import Deku.Control (text)
import Deku.DOM as D
import Deku.DOM.Attributes as DA
import Deku.DOM.Listeners as DL
import Deku.Do as Deku
import Deku.Hooks (useRef, useState')
import Deku.Toplevel (runInBody')
import Effect (Effect)
import ExampleAssitant (ExampleSignature)
import FRP.Event.AnimationFrame (animationFrame)
import FRP.Poll (effectToPoll, integral', sample_, sham)
import FRP.Poll.Time (seconds)

app :: ExampleSignature
app runExample = do
  af <- animationFrame
  runExample.t Deku.do
    setNumber /\ number <- useState'
    nref <- useRef 0.0 number
    D.div_
      [ D.div_
          [ D.input
              [ DA.xtypeRange
              , DL.numberOn_ DL.input setNumber
              , DA.klass_ "w-full"
              , DA.min_ "0.0"
              , DA.max_ "1.0"
              , DA.step_ "0.01"
              , DA.value_ "0.0"
              ]
              []
          ]
      , D.div_
          [ text
              ( sham
                  ( show <$>
                      ( ( sample_
                            ( integral' 0.0
                                (seconds <#> (\(Seconds s) -> s))
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
main = void $ app { t: map (map void) runInBody' }