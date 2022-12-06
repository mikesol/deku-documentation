module Pages.FRP.Sampling.SamplingWithBehaviors.SamplingABehaviorAndDiscardingTheEvent where

import Prelude

import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

samplingABehaviorAndDiscardingTheEvent :: forall lock payload. Subsection lock payload
samplingABehaviorAndDiscardingTheEvent = subsection
    { title: "Sampling a behavior and discarding the event"
    , matter: pure
        [ D.p_
            [ text_ "This subsection will be about "
            , D.span (D.Class !:= "font-bold") [ text_ "Sampling a behavior and discarding the event"]
            , text_ "."
            ]
        ]
    }
