module Pages.CoreConcepts.Portals.GlobalPortals.TheGlobalPortalResult where

import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

theGlobalPortalResult :: forall lock payload. Subsection lock payload
theGlobalPortalResult = subsection
  { title: "The global portal result"
  , matter:
      [ D.p_
          [ text_ "This subsection will be about "
          , D.span (D.Class !:= "font-bold")
              [ text_ "The global portal result" ]
          , text_ "."
          ]
      ]
  }
