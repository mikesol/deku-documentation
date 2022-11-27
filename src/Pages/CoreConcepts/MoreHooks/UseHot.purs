module Pages.CoreConcepts.MoreHooks.UseHot where

import Contracts (Section, section)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D
import Pages.CoreConcepts.MoreHooks.UseHot.KeepingAnElementHot (keepingAnElementHot)
import Pages.CoreConcepts.MoreHooks.UseHot.PerformanceConsiderations (performanceConsiderations)

useHot :: forall lock payload. Section lock payload
useHot = section
  { title: "UseHot"
  , topmatter:
      [ D.p_
          [ text_ "This section will be about "
          , D.span (D.Class !:= "font-bold") [ text_ "UseHot" ]
          , text_ "."
          ]
      ]
  , subsections:
      [ keepingAnElementHot, performanceConsiderations ]
  }
