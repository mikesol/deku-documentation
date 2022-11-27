module Pages.FRP.OtherInstances.Monoid.EventsAsMonoids where

import Prelude

import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

eventsAsMonoids :: forall lock payload. Subsection lock payload
eventsAsMonoids = subsection
  { title: "Events as monoids"
  , matter: pure
      [ D.p_
          [ text_ "This subsection will be about "
          , D.span (D.Class !:= "font-bold") [ text_ "Events as monoids" ]
          , text_ "."
          ]
      ]
  }
