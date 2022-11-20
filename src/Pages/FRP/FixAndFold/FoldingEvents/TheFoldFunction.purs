module Pages.FRP.FixAndFold.FoldingEvents.TheFoldFunction where

import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

theFoldFunction :: forall lock payload. Subsection lock payload
theFoldFunction = subsection
    { title: "The fold function"
    , matter:
        [ D.p_
            [ text_ "This subsection will be about "
            , D.span (D.Class !:= "font-bold") [ text_ "The fold function"]
            , text_ "."
            ]
        ]
    }
