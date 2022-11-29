module Pages.CoreConcepts.Pursx.PursxAlternatives.UnsafePursx where

import Prelude

import Contracts (Subsection, subsection)
import Deku.Attribute ((!:=))
import Deku.Control (text_)
import Deku.DOM as D

unsafePursx :: forall lock payload. Subsection lock payload
unsafePursx = subsection
    { title: "Unsafe pursx"
    , matter: pure
        [ D.p_
            [ text_ "This subsection will be about "
            , D.span (D.Class !:= "font-bold") [ text_ "Unsafe pursx"]
            , text_ "."
            ]
        ]
    }
