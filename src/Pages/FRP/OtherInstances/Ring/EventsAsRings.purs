module Pages.FRP.OtherInstances.Ring.EventsAsRings where

import Prelude

import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

eventsAsRings :: forall lock payload. Subsection lock payload
eventsAsRings = subsection
  { title: "Events as rings"
  , matter: pure
      [ D.p_
          [ text_ "This subsection will be about "
          , D.span (D.Class !:= "font-bold") [ text_ "Events as rings" ]
          , text_ "."
          ]
      ]
  }
