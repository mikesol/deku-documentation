module Pages.FRP.Applicatives.Functor where

import Prelude

import Contracts (Section, section)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D
import Pages.FRP.Applicatives.Functor.PerformanceConsiderations (performanceConsiderations)
import Pages.FRP.Applicatives.Functor.TheMeaningOfMap (theMeaningOfMap)

functor :: forall lock payload. Section lock payload
functor = section
  { title: "Events as functors"
  , topmatter: pure
      [ D.p_
          [ text_ "This section will be about "
          , D.span (D.Class !:= "font-bold") [ text_ "Events as functors" ]
          , text_ "."
          ]
      ]
  , subsections:
      [ theMeaningOfMap, performanceConsiderations ]
  }
