module Pages.FRP.Events.InteractiveEvents where

import Prelude

import Contracts (Section, section)
import Deku.Control (text, text_)
import Deku.DOM as D
import Pages.FRP.Events.InteractiveEvents.TheCreateEffect (theCreateEffect)
import Pages.FRP.Events.InteractiveEvents.PerformanceNotes (performanceNotes)
import Pages.FRP.Events.InteractiveEvents.LifetimeAndGarbageCollection (lifetimeAndGarbageCollection)

interactiveEvents :: Section
interactiveEvents = section
  { title: "Interactive events"
  , topmatter: pure
      [ D.p_
          [ text_ "In the previous section, we saw an example of a "
          , D.b__ "Stand-alone event"
          , text_
              ", or an event that managed its own input and unsubscription. This is quite uncommon at the end of the day - the far more common scenario is one where there is a pusher and an event. This type of event is called an "
          , D.b__ "Interactive event"
          , text_ ", the subject of this section."
          ]
      ]
  , subsections:
      [ theCreateEffect, lifetimeAndGarbageCollection, performanceNotes ]
  }
