module Pages.CoreConcepts.Portals.GlobalPortals where

import Contracts (Section, section)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D
import Pages.CoreConcepts.Portals.GlobalPortals.TheGlobalPortalSyntax (theGlobalPortalSyntax)
import Pages.CoreConcepts.Portals.GlobalPortals.PerformanceConsiderations (performanceConsiderations)
import Pages.CoreConcepts.Portals.GlobalPortals.TheGlobalPortalResult (theGlobalPortalResult)

globalPortals :: forall lock payload. Section lock payload
globalPortals = section
  { title: "GlobalPortals"
  , topmatter:
      [ D.p_
          [ text_ "This section will be about "
          , D.span (D.Class !:= "font-bold") [ text_ "GlobalPortals" ]
          , text_ "."
          ]
      ]
  , subsections:
      [ theGlobalPortalSyntax
      , performanceConsiderations
      , theGlobalPortalResult
      ]
  }
