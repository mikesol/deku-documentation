module Pages.FRP.Sampling.SamplingWithBehaviors.SamplingABehaviorWithACustomFunction where

import Prelude

import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

samplingABehaviorWithACustomFunction :: forall lock payload. Subsection lock payload
samplingABehaviorWithACustomFunction = subsection
    { title: "Sampling a behavior with a function"
    , matter: pure
        [ D.p_
            [ text_ "This subsection will be about "
            , D.span (D.Class !:= "font-bold") [ text_ "Sampling a behavior and discarding the event"]
            , text_ "."
            ]
        ]
    }
