module Pages.FRP.Polls.Calculus.IntegratingPolls where

import Prelude

import Contracts (CollapseState(..), Subsection, getExample, subsection)
import Data.Maybe (Maybe(..))
import Deku.Control (text, text_)
import Deku.DOM as D
import Examples as Examples

integratingPolls :: Subsection
integratingPolls = subsection
  { title: "Integrating polls"
  , matter: do
      example <- getExample StartCollapsed Nothing
        Examples.IntegratingPolls

      pure [ D.p_
          [ text_ "We can use the function "
          , D.code__ "integrate' a b"
          , text_
              " to take the integral of a positional poll for the slider between 0.0 and 1.0 "
          , D.code__ "b"
          , text_ " with respect to a measure of time "
          , D.code__ "a"
          , text_
              ". This simulates a system as if the slider were a gas pedal, the left being your foot off the gas (in this system, no gas means no motion, so imagine a really heavy car going uphill) and 1 being pedal to the metal! The output is the current position."
          ]
      , example
      ]
  }
