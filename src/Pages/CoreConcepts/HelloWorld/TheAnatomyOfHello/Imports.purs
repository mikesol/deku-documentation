module Pages.CoreConcepts.HelloWorld.TheAnatomyOfHello.Imports where

import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

imports :: forall lock payload. Subsection lock payload
imports = subsection
    { title: "Imports"
    , matter:
        [ D.p_
            [ text_ "This subsection will be about "
            , D.span (D.Class !:= "font-bold") [ text_ "Imports"]
            , text_ "."
            ]
        ]
    }
