module Pages.CoreConcepts.Portals.GlobalPortals where

import Prelude

import Contracts (Section, section)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D
import Pages.CoreConcepts.Portals.GlobalPortals.TheGlobalPortalSyntax (theGlobalPortalSyntax)
import Pages.CoreConcepts.Portals.GlobalPortals.PerformanceConsiderations (performanceConsiderations)
import Pages.CoreConcepts.Portals.GlobalPortals.TheGlobalPortalResult (theGlobalPortalResult)

globalPortals :: Section
globalPortals = section
  { title: "Global portals"
  , topmatter: pure
      [ D.p_
          [ text_
              "Global portals are the easiest to work with, but they come with a potential performance price. Let's dive into their syntax!"
          ]
      ]
  , subsections:
      [ theGlobalPortalSyntax
      {-, theGlobalPortalResult-}
      , performanceConsiderations
      ]
  }
