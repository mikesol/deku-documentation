module Pages.CoreConcepts.Components.AddingAttributes.UsefulShorthand where

import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

usefulShorthand :: forall lock payload. Subsection lock payload
usefulShorthand = subsection
    { title: "Useful shorthand"
    , matter:
        [ D.p_
            [ text_ "This subsection will be about "
            , D.span (D.Class !:= "font-bold") [ text_ "Useful shorthand"]
            , text_ "."
            ]
        ]
    }
