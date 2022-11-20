module Pages.FRP.Busses.TheVBus.PerformanceComparedToBus where

import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

performanceComparedToBus :: forall lock payload. Subsection lock payload
performanceComparedToBus = subsection
    { title: "Performance compared to bus"
    , matter:
        [ D.p_
            [ text_ "This subsection will be about "
            , D.span (D.Class !:= "font-bold") [ text_ "Performance compared to bus"]
            , text_ "."
            ]
        ]
    }
