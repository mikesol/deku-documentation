module Pages.CoreConcepts.State.TheStateHook.PushingToAHook where

import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

pushingToAHook :: forall lock payload. Subsection lock payload
pushingToAHook = subsection
    { title: "Pushing to a hook"
    , matter:
        [ D.p_
            [ text_ "This subsection will be about "
            , D.span (D.Class !:= "font-bold") [ text_ "Pushing to a hook"]
            , text_ "."
            ]
        ]
    }
