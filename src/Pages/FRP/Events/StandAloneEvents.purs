module Pages.FRP.Events.StandAloneEvents where

import Prelude

import Contracts (Section, section)
import Deku.Control (text)
import Deku.DOM as D
import Pages.FRP.Events.StandAloneEvents.UnsubscribeEtiquette (unsubscribeEtiquette)
import Pages.FRP.Events.StandAloneEvents.TheMakeEventFunction (theMakeEventFunction)

standAloneEvents :: Section
standAloneEvents = section
  { title: "Stand-alone events"
  , topmatter: pure
      [ D.p_
          [ text "The event based on "
          , D.code__ "setInterval"
          , text " that we saw earlier on this page is an example of a "
          , D.b__ "Stand-alone event"
          , text
              ". These events do not have a pusher associated with them because all of the pushing happens within the event. They also manage their own unsubscribe effects."
          ]
      ]
  , subsections:
      [ theMakeEventFunction, unsubscribeEtiquette ]
  }
