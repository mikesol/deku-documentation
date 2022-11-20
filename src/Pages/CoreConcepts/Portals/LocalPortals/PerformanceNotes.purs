module Pages.CoreConcepts.Portals.LocalPortals.PerformanceNotes where

import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

performanceNotes :: forall lock payload. Subsection lock payload
performanceNotes = subsection
    { title: "Performance notes"
    , matter:
        [ D.p_
            [ text_ "This subsection will be about "
            , D.span (D.Class !:= "font-bold") [ text_ "Performance notes"]
            , text_ "."
            ]
        ]
    }
