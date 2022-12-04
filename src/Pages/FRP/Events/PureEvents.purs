module Pages.FRP.Events.PureEvents where

import Prelude

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
  , topmatter: pure
      [ D.p_
          [ text_ "Events happen in time, and they also trigger all sorts of side effects. They are anything decidedly impure! However, is there any context in which \"pure\" events make sense? What would these events look like?"
          ],
          D.p_
          [ text_ "This section explores the notion of pure events, understanding what they are, where they're useful, and how they're used."
          ]
      ]
  , subsections:
      [ whatIsAnEventWithoutTime
      , theCreatepureEffect
      , theSTMonad
      , theLemmingEvent
      ]
  }
