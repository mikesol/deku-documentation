module Pages.FRP.Sampling.Gating.SwitchingOnBehaviors where

import Prelude

import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

switchingOnBehaviors :: forall lock payload. Subsection lock payload
switchingOnBehaviors = subsection
    { title: "Switching on behaviors"
    , matter: pure
        [ D.p_
            [ text_ "This subsection will be about "
            , D.span (D.Class !:= "font-bold") [ text_ "Switching on behaviors"]
            , text_ "."
            ]
        ]
    }
