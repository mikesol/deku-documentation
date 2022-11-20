module Pages.CoreConcepts.HelloWorld.TheAnatomyOfHello.RunningInTheBody where

import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

runningInTheBody :: forall lock payload. Subsection lock payload
runningInTheBody = subsection
    { title: "Running in the body"
    , matter:
        [ D.p_
            [ text_ "This subsection will be about "
            , D.span (D.Class !:= "font-bold") [ text_ "Running in the body"]
            , text_ "."
            ]
        ]
    }
