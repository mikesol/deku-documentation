module Pages.Introduction.HelloWorld.SayingHello.TheCode where

import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

theCode :: forall lock payload. Subsection lock payload
theCode = subsection
    { title: "The code"
    , matter:
        [ D.p_
            [ text_ "This subsection will be about "
            , D.span (D.Class !:= "font-bold") [ text_ "The code"]
            , text_ "."
            ]
        ]
    }
