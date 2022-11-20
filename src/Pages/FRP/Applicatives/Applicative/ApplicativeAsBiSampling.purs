module Pages.FRP.Applicatives.Applicative.ApplicativeAsBiSampling where

import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

applicativeAsBiSampling :: forall lock payload. Subsection lock payload
applicativeAsBiSampling = subsection
    { title: "Applicative as bi-sampling"
    , matter:
        [ D.p_
            [ text_ "This subsection will be about "
            , D.span (D.Class !:= "font-bold") [ text_ "Applicative as bi-sampling"]
            , text_ "."
            ]
        ]
    }
