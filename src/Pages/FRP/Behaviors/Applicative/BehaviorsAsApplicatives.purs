module Pages.FRP.Behaviors.Applicative.BehaviorsAsApplicatives where

import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

behaviorsAsApplicatives :: forall lock payload. Subsection lock payload
behaviorsAsApplicatives = subsection
    { title: "Behaviors as applicatives"
    , matter:
        [ D.p_
            [ text_ "This subsection will be about "
            , D.span (D.Class !:= "font-bold") [ text_ "Behaviors as applicatives"]
            , text_ "."
            ]
        ]
    }
