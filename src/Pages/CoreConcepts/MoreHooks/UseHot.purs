module Pages.CoreConcepts.MoreHooks.UseHot where

import Prelude


import Contracts (Section, section)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D
import Pages.CoreConcepts.MoreHooks.UseHot.KeepingAnElementHot (keepingAnElementHot)
import Pages.CoreConcepts.MoreHooks.UseHot.PerformanceConsiderations (performanceConsiderations)

useHot :: forall lock payload. Section lock payload
useHot = section
  { title: "Use hot"
  , topmatter: pure
      [ D.p_
          [ text_ "This section will be about "
          , D.span (D.Class !:= "font-bold") [ text_ "Use hot" ]
          , text_ "."
          ]
      ]
  , subsections:
      [ keepingAnElementHot, performanceConsiderations ]
  }
