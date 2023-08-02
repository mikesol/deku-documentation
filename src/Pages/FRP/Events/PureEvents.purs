module Pages.FRP.Events.PureEvents where

import Prelude

import Contracts (Section, section)
import Deku.Control (text)
import Deku.DOM as D
import Pages.FRP.Events.PureEvents.TheCreatepureEffect (theCreatepureEffect)
import Pages.FRP.Events.PureEvents.WhatIsAnEventWithoutTime (whatIsAnEventWithoutTime)
import Pages.FRP.Events.PureEvents.LetsMakeAnEvent (theLemmingEvent)
import Pages.FRP.Events.PureEvents.TheSTMonad (theSTMonad)

pureEvents :: Section
pureEvents = section
  { title: "Pure events"
  , topmatter: pure
      [ D.p_
          [ text
              "Events happen in time, and they also trigger all sorts of side effects. They are anything decidedly impure! However, is there any context in which \"pure\" events make sense? What would these events look like?"
          ]
      , D.p_
          [ text
              "This section explores the notion of pure events, understanding what they are, where they're useful, and how they're used."
          ]
      ]
  , subsections:
      [ whatIsAnEventWithoutTime
      , theCreatepureEffect
      , theSTMonad
      , theLemmingEvent
      ]
  }
