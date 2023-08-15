module Examples.IntegratingPolls where

import Deku.Toplevel (runInBody')
import Effect (Effect)
import Prelude
import ExampleAssitant (ExampleSignature)

import Data.Time.Duration (Seconds(..))
import Data.Tuple.Nested ((/\))
import Deku.Attribute ((:=), (<:=>), (!:=))
import Deku.Attributes (klass, klass_)
import Deku.Control (text, text_)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useState)
import Deku.Listeners (slider)

import FRP.Poll (integral', sample_, stepNE)
import FRP.Poll.Time (seconds)
import FRP.Event.AnimationFrame (animationFrame)

app :: ExampleSignature
app runExample = do
  af <- animationFrame
  runExample Deku.do
    setNumber /\ number <- useState 0.0
    D.div_
      [ D.div_
          [ D.input
              ( slider setNumber <>
                  [ klass_ "w-full"
                  , D.Min !:= "0.0"
                  , D.Max !:= "1.0"
                  , D.Step !:= "0.01"
                  , D.Value !:= "0.0"
                  ]
              )
              []
          ]
      , D.div_
          [ text
              ( show <$>
                  ( ( sample_
                        ( integral' 0.0
                            (seconds <#> (\(Seconds s) -> s))
                            (stepNE number)
                        )
                        af.event
                    )

                  )
              )
          ]
      ]

main :: Effect Unit
main = void $ app (map (map void) runInBody')