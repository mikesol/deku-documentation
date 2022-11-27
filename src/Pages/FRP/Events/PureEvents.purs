module Pages.FRP.Events.PureEvents where

import Contracts (Section, section)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D
import Pages.FRP.Events.PureEvents.TheCreatepureEffect (theCreatepureEffect)
import Pages.FRP.Events.PureEvents.WhatIsAnEventWithoutTime (whatIsAnEventWithoutTime)
import Pages.FRP.Events.PureEvents.TheLemmingEvent (theLemmingEvent)
import Pages.FRP.Events.PureEvents.TheSTMonad (theSTMonad)

pureEvents :: forall lock payload. Section lock payload
pureEvents = section
  { title: "Pure events"
  , topmatter:
      [ D.p_
          [ text_ "This section will be about "
          , D.span (D.Class !:= "font-bold") [ text_ "Pure events" ]
          , text_ "."
          ]
      ]
  , subsections:
      [ whatIsAnEventWithoutTime
      , theCreatepureEffect
      , theSTMonad
      , theLemmingEvent
      ]
  }
