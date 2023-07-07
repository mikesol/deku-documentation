module Pages.FRP.Events.InteractiveEvents.PerformanceNotes where

import Prelude

import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.DOM as D

performanceNotes :: Subsection
performanceNotes = subsection
  { title: "Performance notes"
  , matter: pure
      [ D.p_
          [ text_ "The performance of events created using "
          , D.code__ "create"
          , text_
              " scales linearly with the number of times the event is subscribed to. Any one unsubscribe has logarithmic performance."
          ]
      ]
  }
