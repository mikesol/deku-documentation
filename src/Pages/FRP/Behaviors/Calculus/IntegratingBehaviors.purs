module Pages.FRP.Behaviors.Calculus.IntegratingBehaviors where

import Prelude

import Contracts (CollapseState(..), Subsection, getExample, subsection)
import Data.Maybe (Maybe(..))
import Deku.Control (text)
import Deku.DOM as D
import Examples as Examples

integratingBehaviors :: Subsection
integratingBehaviors = subsection
  { title: "Integrating behaviors"
  , matter: do
      example <- getExample StartCollapsed Nothing
        Examples.IntegratingBehaviors

      pure [ D.p_
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
      , example
      ]
  }
