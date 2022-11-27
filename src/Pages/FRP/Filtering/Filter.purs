module Pages.FRP.Filtering.Filter where

import Prelude


import Contracts (Section, section)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D
import Pages.FRP.Filtering.Filter.FilteringAnEvent (filteringAnEvent)
import Pages.FRP.Filtering.Filter.PerformanceConsiderations (performanceConsiderations)

filter :: forall lock payload. Section lock payload
filter = section
  { title: "Filter"
  , topmatter: pure
      [ D.p_
          [ text_ "This section will be about "
          , D.span (D.Class !:= "font-bold") [ text_ "Filter" ]
          , text_ "."
          ]
      ]
  , subsections:
      [ filteringAnEvent, performanceConsiderations ]
  }
