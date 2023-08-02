module Pages.FRP.FixAndFold.FixingEvents where

import Prelude

import Contracts (Section, section)
import Deku.Control (text)
import Deku.Attribute ((:=))
import Deku.DOM as D
import Pages.FRP.FixAndFold.FixingEvents.Gotchyas (gotchyas)
import Pages.FRP.FixAndFold.FixingEvents.AFeedforwardFilter (aFeedforwardFilter)

fixingEvents :: Section
fixingEvents = section
  { title: "Fixing events"
  , topmatter: pure
      [ D.p_
          [ text "This section will be about "
          , D.span [D.Class := "font-bold"] [ text "Fixing events" ]
          , text "."
          ]
      ]
  , subsections:
      [ gotchyas, aFeedforwardFilter ]
  }
