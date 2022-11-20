module Pages.CoreConcepts.HelloWorld.TheAnatomyOfHello.FillingUpTheDOM where

import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

fillingUpTheDOM :: forall lock payload. Subsection lock payload
fillingUpTheDOM = subsection
    { title: "Filling up the DOM"
    , matter:
        [ D.p_
            [ text_ "This subsection will be about "
            , D.span (D.Class !:= "font-bold") [ text_ "Filling up the DOM"]
            , text_ "."
            ]
        ]
    }
