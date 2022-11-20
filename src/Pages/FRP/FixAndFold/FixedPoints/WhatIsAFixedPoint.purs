module Pages.FRP.FixAndFold.FixedPoints.WhatIsAFixedPoint where

import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

whatIsAFixedPoint :: forall lock payload. Subsection lock payload
whatIsAFixedPoint = subsection
    { title: "What is a fixed point?"
    , matter:
        [ D.p_
            [ text_ "This subsection will be about "
            , D.span (D.Class !:= "font-bold") [ text_ "What is a fixed point?"]
            , text_ "."
            ]
        ]
    }
