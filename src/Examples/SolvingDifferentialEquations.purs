module Examples.SolvingDifferentialEquations where

import Prelude

import Data.Foldable (oneOf)
import Data.Time.Duration (Seconds(..))
import Data.Tuple.Nested ((/\))
import Deku.Attribute ((!:=), (:=))
import Deku.Attributes (klass_)
import Deku.Control (text_)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useState)
import Deku.Listeners (click_)
import Deku.Toplevel (runInBody)
import Effect (Effect)
import FRP.Behavior (sample_, solve2')
import FRP.Behavior.Time (seconds)
import FRP.Event (keepLatest)
import FRP.Event.AnimationFrame (animationFrame)

buttonClass :: String
buttonClass =
  """inline-flex items-center rounded-md
border border-transparent bg-indigo-600 px-3 py-2
text-sm font-medium leading-4 text-white shadow-sm
hover:bg-indigo-700 focus:outline-none focus:ring-2
focus:ring-indigo-500 focus:ring-offset-2 mr-6"""

main :: Effect Unit
main = runInBody Deku.do
  setThunk /\ thunk <- useState unit
  let
    motion = keepLatest $ thunk $>
      ( show >>> (D.Value := _) <$>
          ( sample_
              ( solve2' 1.0 0.0
                  ( seconds <#>
                      (\(Seconds s) -> s)
                  )
                  ( \x dx'dt -> pure (-0.5) * x -
                      (pure 0.1) * dx'dt
                  )
              )
              animationFrame
          )
      )
  D.div_
    [ D.div_
        [ D.button
            ( oneOf
                [ klass_ buttonClass, click_ (setThunk unit) ]
            )
            [ text_ "Restart simulation" ]
        ]
    , D.div_
        [ D.input
            ( oneOf
                [ D.Xtype !:= "range"
                , klass_ "w-full"
                , D.Min !:= "-1.0"
                , D.Max !:= "1.0"
                , D.Step !:= "0.01"
                , motion
                ]
            )
            []
        ]
    ]