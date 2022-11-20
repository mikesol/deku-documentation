module Pages.FRP.Alternatives.Alt.TheOneOfFunction where

import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

theOneOfFunction :: forall lock payload. Subsection lock payload
theOneOfFunction = subsection
    { title: "The oneOf function"
    , matter:
        [ D.p_
            [ text_ "This subsection will be about "
            , D.span (D.Class !:= "font-bold") [ text_ "The oneOf function"]
            , text_ "."
            ]
        ]
    }
