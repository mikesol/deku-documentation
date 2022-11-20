module Pages.CoreConcepts.Providers.FunctionsAsProviders.UsingFunctionsAsMonads where

import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

usingFunctionsAsMonads :: forall lock payload. Subsection lock payload
usingFunctionsAsMonads = subsection
    { title: "Using functions as monads"
    , matter:
        [ D.p_
            [ text_ "This subsection will be about "
            , D.span (D.Class !:= "font-bold") [ text_ "Using functions as monads"]
            , text_ "."
            ]
        ]
    }
