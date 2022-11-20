module Pages.CoreConcepts.Pursx.ASimpleExample.PlainOldHTML where

import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

plainOldHTML :: forall lock payload. Subsection lock payload
plainOldHTML = subsection
    { title: "Plain old HTML"
    , matter:
        [ D.p_
            [ text_ "This subsection will be about "
            , D.span (D.Class !:= "font-bold") [ text_ "Plain old HTML"]
            , text_ "."
            ]
        ]
    }
