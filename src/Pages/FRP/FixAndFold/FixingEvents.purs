module Pages.FRP.FixAndFold.FixingEvents where

import Prelude

import Contracts (Section, section)
import Deku.Control (text_)
import Deku.DOM.Attributes as DA
import Deku.DOM as D
import Pages.FRP.FixAndFold.FixingEvents.Gotchyas (gotchyas)
import Pages.FRP.FixAndFold.FixingEvents.AFeedforwardFilter (aFeedforwardFilter)

fixingEvents :: Section
fixingEvents = section
  { title: "Fixing events"
  , topmatter: pure
      [ D.p_
          [ text_ "This section will be about "
          , D.span [DA.klass_ "font-bold"] [ text_ "Fixing events" ]
          , text_ "."
          ]
      ]
  , subsections:
      [ gotchyas, aFeedforwardFilter ]
  }
