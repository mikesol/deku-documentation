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
  { title: "Local portals"
  , topmatter:
      [ D.p_
          [ text_ "This section will be about "
          , D.span (D.Class !:= "font-bold") [ text_ "Local portals" ]
          , text_ "."
          ]
      ]
  , subsections:
      [ theLocalPortalSyntax
      , unlockingLevels
      , theLocalPortalResult
      , performanceNotes
      ]
  }
