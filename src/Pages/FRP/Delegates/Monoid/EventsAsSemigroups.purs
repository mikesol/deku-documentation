module Pages.FRP.Delegates.Monoid.EventsAsSemigroups where

import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

eventsAsSemigroups :: forall lock payload. Subsection lock payload
eventsAsSemigroups = subsection
  { title: "Events as semigroups"
  , matter:
      [ D.p_
          [ text_ "This subsection will be about "
          , D.span (D.Class !:= "font-bold") [ text_ "Events as semigroups" ]
          , text_ "."
          ]
      ]
  }
