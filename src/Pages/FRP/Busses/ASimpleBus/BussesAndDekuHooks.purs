module Pages.FRP.Busses.ASimpleBus.BussesAndDekuHooks where

import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

bussesAndDekuHooks :: forall lock payload. Subsection lock payload
bussesAndDekuHooks = subsection
    { title: "Busses and deku hooks"
    , matter:
        [ D.p_
            [ text_ "This subsection will be about "
            , D.span (D.Class !:= "font-bold") [ text_ "Busses and deku hooks"]
            , text_ "."
            ]
        ]
    }
