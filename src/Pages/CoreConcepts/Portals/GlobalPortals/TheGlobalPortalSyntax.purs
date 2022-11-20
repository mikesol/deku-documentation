module Pages.CoreConcepts.Portals.GlobalPortals.TheGlobalPortalSyntax where

import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

theGlobalPortalSyntax :: forall lock payload. Subsection lock payload
theGlobalPortalSyntax = subsection
    { title: "The global portal syntax"
    , matter:
        [ D.p_
            [ text_ "This subsection will be about "
            , D.span (D.Class !:= "font-bold") [ text_ "The global portal syntax"]
            , text_ "."
            ]
        ]
    }
