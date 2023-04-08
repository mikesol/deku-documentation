module Pages.FRP.Behaviors.Calculus.SolvingDifferentialEquations where

import Prelude

import Components.Code (psCodeWithLink)
import Components.ExampleBlockquote (exampleBlockquote)
import Contracts (Subsection, subsection)
import Data.Time.Duration (Seconds(..))
import Data.Tuple.Nested ((/\))
import Deku.Attribute ((!:=), (:=))
import Deku.Attributes (klass_)
import Deku.Control (text_)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useState)
import Deku.Listeners (click_)
import Examples as Examples
import FRP.Behavior (sample_, solve2')
import FRP.Behavior.Time (seconds)
import FRP.Event (keepLatest)
import FRP.Event.AnimationFrame (animationFrame)

solvingDifferentialEquations :: Subsection
solvingDifferentialEquations = subsection
  { title: "Solving differential equations"
  , matter: pure
      [ D.p_
          [ text_
              "Last but not least, we can solve a second order differential equation of the form "
          , D.code__ "d^2a/dt^2 = f a (da/dt)"
          , text_ " using the "
          , D.code__ "solve2'"
          , text_ " function."
          , text_
              " As the left side is the acceleration of the system, we can solve by integrating twice (using the "
          , D.code__ "integrate'"
          , text_
              " function above) after specifying the initial conditions for position and velocity. For example, below we create a damped oscillator using the equation "
          , D.code__ "\\x dx'dt -> -⍺ * x - δ * dx'dt"
          , text_ ". In this case, both "
          , D.code__ "x"
          , text_ " (position) and "
          , D.code__ "dx'dt"
          , text_ " (veclocity) are behaviors."
          ]

      , psCodeWithLink Examples.SolvingDifferentialEquations
      , exampleBlockquote
          [ Deku.do
              setThunk /\ thunk <- useState unit
              let
                buttonClass =
                  """inline-flex items-center rounded-md
              border border-transparent bg-indigo-600 px-3 py-2
              text-sm font-medium leading-4 text-white shadow-sm
              hover:bg-indigo-700 focus:outline-none focus:ring-2
              focus:ring-indigo-500 focus:ring-offset-2 mr-6"""
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
          ]
      , D.p__
          "Granted, these methods may not be immediately useful if you're using Deku to build a SaaS dashboard or documentation site. But the day you're hired by the American Calculus Lovers' Association to build their website, you'll have a nice head start!"
      ]
  }
