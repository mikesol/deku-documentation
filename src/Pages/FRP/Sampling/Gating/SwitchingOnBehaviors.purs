module Pages.FRP.Sampling.Gating.SwitchingOnPolls where

import Prelude

import Contracts (CollapseState(..), Subsection, getExample, subsection)
import Data.Maybe (Maybe(..))
import Deku.Control (text, text_)
import Deku.DOM as D
import Examples as Examples

switchingOnPolls :: Subsection
switchingOnPolls = subsection
  { title: "Switching on polls"
  , matter: do
      example <- getExample StartCollapsed Nothing
        Examples.SwitchingOnPolls
      pure
        [ D.p_
            [ text
                "A close cousin of gating is switching, which alternates between polls based on an event. In the random number generator below, you'll see the distribution of the poll shrink or expand via the switcher."
            ]
        , example
        ]
  }
