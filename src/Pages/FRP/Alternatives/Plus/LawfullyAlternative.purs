module Pages.FRP.Alternatives.Plus.LawfullyAlternative where

import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

lawfullyAlternative :: forall lock payload. Subsection lock payload
lawfullyAlternative = subsection
    { title: "Lawfully alternative"
    , matter:
        [ D.p_
            [ text_ "This subsection will be about "
            , D.span (D.Class !:= "font-bold") [ text_ "Lawfully alternative"]
            , text_ "."
            ]
        ]
    }
