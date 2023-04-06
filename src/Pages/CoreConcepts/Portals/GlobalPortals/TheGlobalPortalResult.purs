module Pages.CoreConcepts.Portals.GlobalPortals.TheGlobalPortalResult where

import Prelude

import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

theGlobalPortalResult :: Subsection
theGlobalPortalResult = subsection
  { title: "The global portal result"
  , matter: pure
      [ D.p_
          [ text_ "This subsection will be about "
          , D.span [D.Class !:= "font-bold"]
              [ text_ "The global portal result" ]
          , text_ "."
          ]
      ]
  }
