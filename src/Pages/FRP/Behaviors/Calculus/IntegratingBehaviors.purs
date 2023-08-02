module Pages.FRP.Behaviors.Calculus.IntegratingBehaviors where

import Prelude

import Components.Code (psCodeWithLink)
import Components.ExampleBlockquote (exampleBlockquote)
import Contracts (Subsection, subsection)
import Data.Time.Duration (Seconds(..))
import Data.Tuple.Nested ((/\))
import Deku.Attribute ((:=))
import Deku.Attributes (klass)
import Deku.Control (text)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useState)
import Deku.Listeners (slider)
import Examples as Examples
import FRP.Behavior (integral', sample_, step)
import FRP.Behavior.Time (seconds)
import FRP.Event.AnimationFrame (animationFrame)

integratingBehaviors :: Subsection
integratingBehaviors = subsection
  { title: "Integrating behaviors"
  , matter: pure
      [ D.p_
          [ text "We can use the function "
          , D.code__ "integrate' a b"
          , text
              " to take the integral of a positional behavior for the slider between 0.0 and 1.0 "
          , D.code__ "b"
          , text " with respect to a measure of time "
          , D.code__ "a"
          , text
              ". This simulates a system as if the slider were a gas pedal, the left being your foot off the gas (in this system, no gas means no motion, so imagine a really heavy car going uphill) and 1 being pedal to the metal! The output is the current position."
          ]
      , psCodeWithLink Examples.IntegratingBehaviors
      , exampleBlockquote
          [ Deku.do
              setNumber /\ number <- useState 0.0
              D.div_
                [ D.div_
                    [ D.input
                            [ slider setNumber
                            , klass "w-full"
                            , D.Min := "0.0"
                            , D.Max := "1.0"
                            , D.Step := "0.01"
                            , D.Value := "0.0"
                            ]
                        
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
          ]
      ]
  }
