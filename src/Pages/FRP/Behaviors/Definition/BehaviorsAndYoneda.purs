module Pages.FRP.Behaviors.Definition.BehaviorsAndYoneda where

import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

behaviorsAndYoneda :: forall lock payload. Subsection lock payload
behaviorsAndYoneda = subsection
    { title: "Behaviors and Yoneda"
    , matter:
        [ D.p_
            [ text_ "This subsection will be about "
            , D.span (D.Class !:= "font-bold") [ text_ "Behaviors and Yoneda"]
            , text_ "."
            ]
        ]
    }
