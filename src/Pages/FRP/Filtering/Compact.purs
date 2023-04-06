module Pages.FRP.Filtering.Compact where

import Prelude

import Contracts (Section, section)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D
import Pages.FRP.Filtering.Compact.CompactingEvents (compactingEvents)
import Pages.FRP.Filtering.Compact.WhyEventsCannotWither (whyEventsCannotWither)

compact :: Section
compact = section
  { title: "Compact"
  , topmatter: pure
      [ D.p_
          [ text_
              "Events are compactable as well, which is extremely useful for sketching out systems that occassionally fail before developing robust error handling. The "
          , D.code__ "compact"
          , text_ " function for "
          , D.code__ "Event"
          , text_ " is defined as "
          , D.code__ "filterMap identity"
          , text_ "."
          ]
      ]
  , subsections:
      [ compactingEvents, whyEventsCannotWither ]
  }
