module Pages.CoreConcepts.Portals.LocalPortals where

import Contracts (Section, section)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D
import Pages.CoreConcepts.Portals.LocalPortals.TheLocalPortalResult (theLocalPortalResult)
import Pages.CoreConcepts.Portals.LocalPortals.PerformanceNotes (performanceNotes)
import Pages.CoreConcepts.Portals.LocalPortals.TheLocalPortalSyntax (theLocalPortalSyntax)
import Pages.CoreConcepts.Portals.LocalPortals.UnlockingLevels (unlockingLevels)

localPortals :: forall lock payload. Section lock payload
localPortals = section
  { title: "LocalPortals"
  , topmatter:
      [ D.p_
          [ text_ "This section will be about "
          , D.span (D.Class !:= "font-bold") [ text_ "LocalPortals" ]
          , text_ "."
          ]
      ]
  , subsections:
      [ theLocalPortalResult
      , performanceNotes
      , theLocalPortalSyntax
      , unlockingLevels
      ]
  }
