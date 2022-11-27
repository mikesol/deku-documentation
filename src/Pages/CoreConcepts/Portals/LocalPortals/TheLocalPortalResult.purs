module Pages.CoreConcepts.Portals.LocalPortals.TheLocalPortalResult where

import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

theLocalPortalResult :: forall lock payload. Subsection lock payload
theLocalPortalResult = subsection
  { title: "The local portal result"
  , matter:
      [ D.p_
          [ text_ "This subsection will be about "
          , D.span (D.Class !:= "font-bold") [ text_ "The local portal result" ]
          , text_ "."
          ]
      ]
  }
