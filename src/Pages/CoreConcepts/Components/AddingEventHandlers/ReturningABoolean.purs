module Pages.CoreConcepts.Components.AddingEventHandlers.ReturningABoolean where

import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

returningABoolean :: forall lock payload. Subsection lock payload
returningABoolean = subsection
    { title: "Returning a boolean"
    , matter:
        [ D.p_
            [ text_ "This subsection will be about "
            , D.span (D.Class !:= "font-bold") [ text_ "Returning a boolean"]
            , text_ "."
            ]
        ]
    }
