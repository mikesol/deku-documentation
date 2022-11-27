module Pages.FRP.FixAndFold.FixingEvents where

import Contracts (Section, section)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D
import Pages.FRP.FixAndFold.FixingEvents.Gotchyas (gotchyas)
import Pages.FRP.FixAndFold.FixingEvents.AFeedforwardFilter (aFeedforwardFilter)

fixingEvents :: forall lock payload. Section lock payload
fixingEvents = section
  { title: "Fixing events"
  , topmatter:
      [ D.p_
          [ text_ "This section will be about "
          , D.span (D.Class !:= "font-bold") [ text_ "Fixing events" ]
          , text_ "."
          ]
      ]
  , subsections:
      [ gotchyas, aFeedforwardFilter ]
  }
