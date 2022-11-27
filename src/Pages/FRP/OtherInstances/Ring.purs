module Pages.FRP.OtherInstances.Ring where

import Contracts (Section, section)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D
import Pages.FRP.OtherInstances.Ring.EventsAsSemirings (eventsAsSemirings)
import Pages.FRP.OtherInstances.Ring.EventsAsRings (eventsAsRings)

ring :: forall lock payload. Section lock payload
ring = section
  { title: "Ring"
  , topmatter:
      [ D.p_
          [ text_ "This section will be about "
          , D.span (D.Class !:= "font-bold") [ text_ "Ring" ]
          , text_ "."
          ]
      ]
  , subsections:
      [ eventsAsSemirings, eventsAsRings ]
  }
