module Examples.IntegratingBehaviors where

import Deku.Toplevel (runInBody)
import Prelude
import ExampleAssitant (ExampleSignature)

import Data.Time.Duration (Seconds(..))
import Data.Tuple.Nested ((/\))
import Deku.Attribute ((:=))
import Deku.Attributes (klass)
import Deku.Control (text)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useState)
import Deku.Listeners (slider)

import FRP.Behavior (integral', sample_, stepNE)
import FRP.Behavior.Time (seconds)
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
                  [ klass "w-full"
                  , D.Min := "0.0"
                  , D.Max := "1.0"
                  , D.Step := "0.01"
                  , D.Value := "0.0"
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