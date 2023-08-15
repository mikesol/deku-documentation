module Pages.FRP.Polls.Calculus.DerivingPolls where

import Prelude

import Contracts (CollapseState(..), Subsection, getExample, subsection)
import Data.Maybe (Maybe(..))
import Deku.Control (text, text_)
import Deku.DOM as D
import Examples as Examples

derivingPolls :: Subsection
derivingPolls = subsection
  { title: "Derivatives of polls"
  , matter: do
      example <- getExample StartCollapsed Nothing
        Examples.DerivingPolls
      pure [ D.p_
          [ text_ "We can use the function "
          , D.code__ "derivative' a b"
          , text
              " to take the derivative of a positional poll for the slider between 0.0 and 1.0 "
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
              , text
                  ": Starting from an initial value, update a poll based on an event's most recent value."
              ]
          , D.li_
              [ D.code__ "animationFrame"
              , text_ ": An event that emits on each browser animation frame."
              ]
          ]
      , example
      ]
  }
