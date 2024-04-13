module Examples.SolvingDifferentialEquations where

import Prelude

import Data.Time.Duration (Seconds(..))
import Data.Tuple.Nested ((/\))
import Deku.Control (text_)
import Deku.DOM as D
import Deku.DOM.Attributes as DA
import Deku.DOM.Listeners as DL
import Deku.Do as Deku
import Deku.Hooks (useState)
import Deku.Toplevel (runInBody)
import Effect (Effect)
import ExampleAssitant (ExampleSignature)
import FRP.Event (keepLatest)
import FRP.Event.AnimationFrame (animationFrame')
import FRP.Poll (sample_, sham, solve2')

buttonClass :: String
buttonClass =
  """inline-flex items-center rounded-md
border border-transparent bg-indigo-600 px-3 py-2
text-sm font-medium leading-4 text-white shadow-sm
hover:bg-indigo-700 focus:outline-none focus:ring-2
focus:ring-indigo-500 focus:ring-offset-2 mr-6"""

app :: ExampleSignature
app runExample = do
  af <- animationFrame' withTime
  runExample Deku.do
    setThunk /\ thunk <- useState unit
    let
      motion = keepLatest $ thunk $>
        ( sham
            ( map show $ sample_
                ( solve2' 1.0 0.0
                    ( ?hole <#>
                        (\(Seconds s) -> s)
                    )
                    ( \x dx'dt -> pure (-0.5) * x -
                        (pure 0.1) * dx'dt
                    )
                )
                af.event
            )
        )
    D.div_
      [ D.div_
          [ D.button
              [ DA.klass_ buttonClass, DL.click_ \_ -> (setThunk unit) ]
              [ text_ "Restart simulation" ]
          ]
      , D.div_
          [ D.input
              [ DA.xtype_ "range"
              , DA.klass_ "w-full"
              , DA.min_ "-1.0"
              , DA.max_ "1.0"
              , DA.step_ "0.01"
              , DA.value motion
              ]
              []
          ]
      ]

main :: Effect Unit
main = void $ app $ map pure runInBody