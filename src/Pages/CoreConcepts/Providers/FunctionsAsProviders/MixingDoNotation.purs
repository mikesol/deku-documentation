module Pages.CoreConcepts.Providers.FunctionsAsProviders.MixingDoNotation where

import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

mixingDoNotation :: forall lock payload. Subsection lock payload
mixingDoNotation = subsection
    { title: "Mixing do notation"
    , matter:
        [ D.p_
            [ text_ "This subsection will be about "
            , D.span (D.Class !:= "font-bold") [ text_ "Mixing do notation"]
            , text_ "."
            ]
        ]
    }
