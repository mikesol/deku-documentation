module Pages.CoreConcepts.Portals.LocalPortals.TheLocalPortalSyntax where

import Prelude

import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

theLocalPortalSyntax :: forall lock payload. Subsection lock payload
theLocalPortalSyntax = subsection
  { title: "The local portal syntax"
  , matter: pure
      [ D.p_
          [ text_ "This subsection will be about "
          , D.span (D.Class !:= "font-bold") [ text_ "The local portal syntax" ]
          , text_ "."
          ]
      ]
  }
