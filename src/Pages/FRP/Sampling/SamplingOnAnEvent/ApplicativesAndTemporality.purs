module Pages.FRP.Sampling.SamplingOnAnEvent.ApplicativesAndTemporality where

import Prelude

import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

applicativesAndTemporality :: forall lock payload. Subsection lock payload
applicativesAndTemporality = subsection
  { title: "Applicatives and temporality"
  , matter: pure
      [ D.p_
          [ text_ "This subsection will be about "
          , D.span (D.Class !:= "font-bold")
              [ text_ "Applicatives and temporality" ]
          , text_ "."
          ]
      ]
  }
