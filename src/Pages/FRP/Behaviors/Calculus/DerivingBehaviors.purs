module Pages.FRP.Behaviors.Calculus.DerivingBehaviors where

import Prelude

import Components.Code (psCodeWithLink)
import Components.ExampleBlockquote (exampleBlockquote)
import Contracts (Subsection, subsection)
import Data.Array (drop, length, null)
import Data.Foldable (sum)
import Data.Int (toNumber)
import Data.Number (isNaN)
import Data.Time.Duration (Seconds(..))
import Data.Tuple.Nested ((/\))
import Deku.Attribute ((!:=))
import Deku.Attributes (klass_)
import Deku.Control (text, text_)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useState)
import Deku.Listeners (slider_)
import Examples as Examples
import FRP.Behavior (derivative', sample_, step)
import FRP.Behavior.Time (seconds)
import FRP.Event (fold)
import FRP.Event.AnimationFrame (animationFrame)

derivingBehaviors :: Subsection
derivingBehaviors = subsection
  { title: "Derivatives of behaviors"
  , matter: pure
      [ D.p_
          [ text_ "We can use the function "
          , D.code__ "derivative' a b"
          , text_
              " to take the derivative of a positional behavior for the slider between 0.0 and 1.0 "
          , D.code__ "b"
          , text_ " with respect to a measure of time "
          , D.code__ "a"
          , text_ ". This is also called "
          , D.i__ "velocity"
          , text_ ". We'll add a small lag to the velocity using "
          , D.code__ "fold"
          , text_ ". This example adds two new helpful functions:"
          ]
      , D.ul_
          [ D.li_
              [ D.code__ "step"
              , text_
                  ": Starting from an initial value, update a behavior based on an event's most recent value."
              ]
          , D.li_
              [ D.code__ "animationFrame"
              , text_ ": An event that emits on each browser animation frame."
              ]
          ]
      , psCodeWithLink Examples.DerivingBehaviors
      , exampleBlockquote
          [ Deku.do
              setNumber /\ number <- useState 0.5
              let
                average l
                  | null l = 0.0
                  | otherwise = sum l / (toNumber $ length l)
                unNaN n = if isNaN n then 0.0 else n
              D.div_
                [ D.div_
                    [ D.input
                            [ slider_ setNumber
                            , klass_ "w-full"
                            , D.Min !:= "0.0"
                            , D.Max !:= "1.0"
                            , D.Step !:= "0.01"
                            , D.Value !:= "0.5"
                            ]
                        
                        []
                    ]
                , D.div_
                    [ text
                        ( average >>> unNaN >>> show <$>
                            ( fold
                                ( \b a ->
                                    if length b < 10 then b <> [ a ]
                                    else (drop 1 b) <> [ a ]
                                )
                                []
                                ( sample_
                                    ( derivative'
                                        (seconds <#> (\(Seconds s) -> s))
                                        (step 0.5 number)
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
