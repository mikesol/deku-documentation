module Pages.CoreConcepts.Components.AddingEventHandlers.UsingAnEffect where

import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

usingAnEffect :: forall lock payload. Subsection lock payload
usingAnEffect = subsection
    { title: "Using an effect"
    , matter:
        [ D.p_
            [ text_ "This subsection will be about "
            , D.span (D.Class !:= "font-bold") [ text_ "Using an effect"]
            , text_ "."
            ]
        ]
    }
