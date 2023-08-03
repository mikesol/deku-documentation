module Pages.FRP.Behaviors.Calculus.DerivingBehaviors where

import Prelude

import Contracts (CollapseState(..), Subsection, getExample, subsection)
import Data.Maybe (Maybe(..))
import Deku.Control (text)
import Deku.DOM as D
import Examples as Examples

derivingBehaviors :: Subsection
derivingBehaviors = subsection
  { title: "Derivatives of behaviors"
  , matter: do
      example <- getExample StartCollapsed Nothing
        Examples.DerivingBehaviors
      pure [ D.p_
          [ text "We can use the function "
          , D.code__ "derivative' a b"
          , text
              " to take the derivative of a positional behavior for the slider between 0.0 and 1.0 "
          , D.code__ "b"
          , text " with respect to a measure of time "
          , D.code__ "a"
          , text ". This is also called "
          , D.i__ "velocity"
          , text ". We'll add a small lag to the velocity using "
          , D.code__ "fold"
          , text ". This example adds two new helpful functions:"
          ]
      , D.ul_
          [ D.li_
              [ D.code__ "step"
              , text
                  ": Starting from an initial value, update a behavior based on an event's most recent value."
              ]
          , D.li_
              [ D.code__ "animationFrame"
              , text ": An event that emits on each browser animation frame."
              ]
          ]
      , example
      ]
  }
