module Pages.CoreConcepts.Components.AddingAttributes.RemovingTheUnderscore where

import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

removingTheUnderscore :: forall lock payload. Subsection lock payload
removingTheUnderscore = subsection
    { title: "Removing the underscore"
    , matter:
        [ D.p_
            [ text_ "This subsection will be about "
            , D.span (D.Class !:= "font-bold") [ text_ "Removing the underscore"]
            , text_ "."
            ]
        ]
    }
