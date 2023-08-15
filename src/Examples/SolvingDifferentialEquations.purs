module Examples.SolvingDifferentialEquations where

import Prelude

import Data.Time.Duration (Seconds(..))
import Data.Tuple.Nested ((/\))
import Deku.Attribute ((!:=), (<:=>))
import Deku.Attributes (klass_)
import Deku.Control (text_)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useState)
import Deku.Listeners (click_)
import Deku.Toplevel (runInBody')
import Effect (Effect)
import ExampleAssitant (ExampleSignature)
import FRP.Event (keepLatest)
import FRP.Event.AnimationFrame (animationFrame)
import FRP.Poll (sample_, sham, solve2')
import FRP.Poll.Time (seconds)

buttonClass :: String
buttonClass =
  """inline-flex items-center rounded-md
border border-transparent bg-indigo-600 px-3 py-2
text-sm font-medium leading-4 text-white shadow-sm
hover:bg-indigo-700 focus:outline-none focus:ring-2
focus:ring-indigo-500 focus:ring-offset-2 mr-6"""

app :: ExampleSignature
app runExample = do
  af <- animationFrame
  runExample Deku.do
    setThunk /\ thunk <- useState unit
    let
      motion = keepLatest $ thunk $>
        ( sham
            ( D.Value <:=>
                ( map show $ sample_
                    ( solve2' 1.0 0.0
                        ( seconds <#>
                            (\(Seconds s) -> s)
                        )
                        ( \x dx'dt -> pure (-0.5) * x -
                            (pure 0.1) * dx'dt
                        )
                    )
                    af.event
                )
            )
        )
    D.div_
      [ D.div_
          [ D.button
              [ klass_ buttonClass, click_ (setThunk unit) ]
              [ text_ "Restart simulation" ]
          ]
      , D.div_
          [ D.input
              [ D.Xtype !:= "range"
              , klass_ "w-full"
              , D.Min !:= "-1.0"
              , D.Max !:= "1.0"
              , D.Step !:= "0.01"
              , motion
              ]
              []
          ]
      ]

main :: Effect Unit
main = void $ app (map (map void) runInBody')