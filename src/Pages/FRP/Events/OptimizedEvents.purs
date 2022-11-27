module Pages.FRP.Events.OptimizedEvents where

import Contracts (Section, section)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D
import Pages.FRP.Events.OptimizedEvents.OptimizedEventCreation (optimizedEventCreation)
import Pages.FRP.Events.OptimizedEvents.OptimizedEventFunctions (optimizedEventFunctions)

optimizedEvents :: forall lock payload. Section lock payload
optimizedEvents = section
  { title: "Optimized events"
  , topmatter:
      [ D.p_
          [ text_ "This section will be about "
          , D.span (D.Class !:= "font-bold") [ text_ "Optimized events" ]
          , text_ "."
          ]
      ]
  , subsections:
      [ optimizedEventCreation, optimizedEventFunctions ]
  }
