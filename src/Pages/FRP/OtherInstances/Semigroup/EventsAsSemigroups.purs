module Pages.FRP.OtherInstances.Semigroup.EventsAsSemigroups where

import Prelude

import Contracts (CollapseState(..), Subsection, getExample, subsection)
import Data.Maybe (Maybe(..))
import Deku.Control (text_)
import Deku.DOM as D
import Examples as Examples

eventsAsSemigroups :: Subsection
eventsAsSemigroups = subsection
  { title: "Events as semigroups"
  , matter: do
      example <- getExample StartCollapsed Nothing Examples.EventsAsSemigroups
      pure
        [ D.p_
            [ text_
                "The example below shows how two events can be appended together to control classes in the DOM."
            ]
        , example
        ]
  }
