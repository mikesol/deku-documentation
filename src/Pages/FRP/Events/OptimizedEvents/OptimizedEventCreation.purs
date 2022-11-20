module Pages.FRP.Events.OptimizedEvents.OptimizedEventCreation where

import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

optimizedEventCreation :: forall lock payload. Subsection lock payload
optimizedEventCreation = subsection
    { title: "Optimized event creation"
    , matter:
        [ D.p_
            [ text_ "This subsection will be about "
            , D.span (D.Class !:= "font-bold") [ text_ "Optimized event creation"]
            , text_ "."
            ]
        ]
    }
