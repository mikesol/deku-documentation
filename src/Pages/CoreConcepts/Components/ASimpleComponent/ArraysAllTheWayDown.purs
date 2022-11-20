module Pages.CoreConcepts.Components.ASimpleComponent.ArraysAllTheWayDown where

import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

arraysAllTheWayDown :: forall lock payload. Subsection lock payload
arraysAllTheWayDown = subsection
    { title: "Arrays all the way down"
    , matter:
        [ D.p_
            [ text_ "This subsection will be about "
            , D.span (D.Class !:= "font-bold") [ text_ "Arrays all the way down"]
            , text_ "."
            ]
        ]
    }
