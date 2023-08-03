module Pages.FRP.Sampling.Gating.SwitchingOnBehaviors where

import Prelude

import Contracts (CollapseState(..), Subsection, getExample, subsection)
import Data.Maybe (Maybe(..))
import Deku.Control (text)
import Deku.DOM as D
import Examples as Examples

switchingOnBehaviors :: Subsection
switchingOnBehaviors = subsection
  { title: "Switching on behaviors"
  , matter: do
      example <- getExample StartCollapsed Nothing
        Examples.SwitchingOnBehaviors
      pure
        [ D.p_
            [ text
                "A close cousin of gating is switching, which alternates between behaviors based on an event. In the random number generator below, you'll see the distribution of the behavior shrink or expand via the switcher."
            ]
        , example
        ]
  }
