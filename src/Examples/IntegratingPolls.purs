module Examples.IntegratingPolls where

import Prelude

import Data.Time.Duration (Seconds(..))
import Data.Tuple.Nested ((/\))
import Deku.Attribute ((!:=))
import Deku.Attributes (klass_)
import Deku.Control (text)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useState)
import Deku.Listeners (slider_)
import Deku.Toplevel (runInBody')
import Effect (Effect)
import ExampleAssitant (ExampleSignature)
import FRP.Event.AnimationFrame (animationFrame)
import FRP.Poll (integral', sample_, sham)
import FRP.Poll.Time (seconds)

app :: ExampleSignature
app runExample = do
  af <- animationFrame
  runExample Deku.do
    setNumber /\ number <- useState 0.0
    D.div_
      [ D.div_
          [ D.input
              [ slider_ setNumber
              , klass_ "w-full"
              , D.Min !:= "0.0"
              , D.Max !:= "1.0"
              , D.Step !:= "0.01"
              , D.Value !:= "0.0"
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
                                number
                            )
                            af.event
                        )

                      )
                  )
              )
          ]
      ]

main :: Effect Unit
main = void $ app (map (map void) runInBody')