module Pages.FRP.OtherInstances.Monoid.EventsAsSemigroups where

import Prelude

import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

eventsAsSemigroups :: forall lock payload. Subsection lock payload
eventsAsSemigroups = subsection
  { title: "Events as semigroups"
  , matter: pure
      [ D.p_
          [ text_ "This subsection will be about "
          , D.span (D.Class !:= "font-bold") [ text_ "Events as semigroups" ]
          , text_ "."
          ]
      ]
  }
