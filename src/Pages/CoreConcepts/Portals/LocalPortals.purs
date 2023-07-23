module Pages.CoreConcepts.Portals.LocalPortals where

import Prelude

import Contracts (Section, section)
import Deku.Control (text_)
import Deku.DOM as D
import Pages.CoreConcepts.Portals.LocalPortals.PerformanceNotes (performanceNotes)
import Pages.CoreConcepts.Portals.LocalPortals.TheLocalPortalSyntax (theLocalPortalSyntax)
import Pages.CoreConcepts.Portals.LocalPortals.UnlockingLevels (unlockingLevels)

localPortals :: Section
localPortals = section
  { title: "Local portals"
  , topmatter: pure
      [ D.p_
          [ text_ "Let's rewrite the example above using local portals."
          ]
      ]
  , subsections:
      [ theLocalPortalSyntax
      , unlockingLevels
      {-, theLocalPortalResult-}
      , performanceNotes
      ]
  }
