module Pages.CoreConcepts.Portals.GlobalPortals.TheGlobalPortalResult where

import Prelude

import Contracts (Subsection, subsection)
import Deku.Control (text)
import Deku.Attribute ((:=))
import Deku.DOM as D

theGlobalPortalResult :: Subsection
theGlobalPortalResult = subsection
  { title: "The global portal result"
  , matter: pure
      [ D.p_
          [ text "This subsection will be about "
          , D.span [ D.Class := "font-bold" ]
              [ text "The global portal result" ]
          , text "."
          ]
      ]
  }
