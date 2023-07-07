module Pages.FRP.OtherInstances.Ring where

import Prelude

import Contracts (Section, section)
import Deku.Control (text_)
import Deku.DOM as D
import Pages.FRP.OtherInstances.Ring.EventsAsSemirings (eventsAsSemirings)
import Pages.FRP.OtherInstances.Ring.EventsAsRings (eventsAsRings)

ring :: Section
ring = section
  { title: "Ring"
  , topmatter: pure
      [ D.p_
          [ text_
              "You can add, multiply, and subtract events like they were numbers thanks to the "
          , D.code__ "Ring"
          , text_ " instance. Let's see how in this section."
          ]
      ]
  , subsections:
      [ eventsAsSemirings, eventsAsRings ]
  }
