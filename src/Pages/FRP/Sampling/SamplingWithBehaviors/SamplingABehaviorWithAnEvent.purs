module Pages.FRP.Sampling.SamplingWithBehaviors.SamplingABehaviorWithAnEvent where

import Prelude

import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

samplingABehaviorWithAnEvent :: forall lock payload. Subsection lock payload
samplingABehaviorWithAnEvent = subsection
    { title: "Sampling a behavior with an event"
    , matter: pure
        [ D.p_
            [ text_ "This subsection will be about "
            , D.span (D.Class !:= "font-bold") [ text_ "Sampling a behavior with an event"]
            , text_ "."
            ]
        ]
    }
