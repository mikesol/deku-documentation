module Pages.FRP.Sampling.SamplingOnAnEvent.SamplingApplicativesAndTemporality where

import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

samplingApplicativesAndTemporality :: forall lock payload. Subsection lock payload
samplingApplicativesAndTemporality = subsection
    { title: "Sampling, applicatives, and temporality"
    , matter:
        [ D.p_
            [ text_ "This subsection will be about "
            , D.span (D.Class !:= "font-bold") [ text_ "Sampling, applicatives, and temporality"]
            , text_ "."
            ]
        ]
    }
