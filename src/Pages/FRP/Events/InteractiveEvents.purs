module Pages.FRP.Events.InteractiveEvents where

import Contracts (Section, section)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D
import Pages.FRP.Events.InteractiveEvents.TheCreateEffect (theCreateEffect)
import Pages.FRP.Events.InteractiveEvents.PerformanceNotes (performanceNotes)
import Pages.FRP.Events.InteractiveEvents.LifetimeAndGarbageCollection (lifetimeAndGarbageCollection)

interactiveEvents :: forall lock payload. Section lock payload
interactiveEvents = section
  { title: "Interactive events"
  , topmatter:
      [ D.p_
          [ text_ "This section will be about "
          , D.span (D.Class !:= "font-bold") [ text_ "Interactive events" ]
          , text_ "."
          ]
      ]
  , subsections:
      [ theCreateEffect, lifetimeAndGarbageCollection, performanceNotes ]
  }
