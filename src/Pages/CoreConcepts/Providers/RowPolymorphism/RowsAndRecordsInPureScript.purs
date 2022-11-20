module Pages.CoreConcepts.Providers.RowPolymorphism.RowsAndRecordsInPureScript where

import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

rowsAndRecordsInPureScript :: forall lock payload. Subsection lock payload
rowsAndRecordsInPureScript = subsection
    { title: "Rows and records in PureScript"
    , matter:
        [ D.p_
            [ text_ "This subsection will be about "
            , D.span (D.Class !:= "font-bold") [ text_ "Rows and records in PureScript"]
            , text_ "."
            ]
        ]
    }
