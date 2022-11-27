module Pages.FRP.Filtering.Compact where

import Prelude


import Contracts (Section, section)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D
import Pages.FRP.Filtering.Compact.CompactingEvents (compactingEvents)
import Pages.FRP.Filtering.Compact.WhyEventsCannotWither (whyEventsCannotWither)

compact :: forall lock payload. Section lock payload
compact = section
  { title: "Compact"
  , topmatter: pure
      [ D.p_
          [ text_ "This section will be about "
          , D.span (D.Class !:= "font-bold") [ text_ "Compact" ]
          , text_ "."
          ]
      ]
  , subsections:
      [ compactingEvents, whyEventsCannotWither ]
  }
