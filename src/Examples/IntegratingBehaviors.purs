module Examples.IntegratingBehaviors where

import Prelude

import Data.Foldable (oneOf)
import Data.Time.Duration (Seconds(..))
import Data.Tuple.Nested ((/\))
import Deku.Attribute ((!:=))
import Deku.Attributes (klass_)
import Deku.Control (text)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useState)
import Deku.Listeners (slider_)
import Deku.Toplevel (runInBody)
import Effect (Effect)
import FRP.Behavior (integral', sample_, step)
import FRP.Behavior.Time (seconds)
import FRP.Event.AnimationFrame (animationFrame)

main :: Effect Unit
main = runInBody Deku.do
  setNumber /\ number <- useState 0.0
  D.div_
    [ D.div_
        [ D.input
            ( oneOf
                [ slider_ setNumber
                , klass_ "w-full"
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
                          (step 0.0 number)
                      )
                      animationFrame
                  )

                )
            )
        ]
    ]