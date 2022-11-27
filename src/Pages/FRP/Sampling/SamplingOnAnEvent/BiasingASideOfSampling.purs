module Pages.FRP.Sampling.SamplingOnAnEvent.BiasingASideOfSampling where

import Prelude


import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

biasingASideOfSampling :: forall lock payload. Subsection lock payload
biasingASideOfSampling = subsection
  { title: "Biasing a side of sampling"
  , matter: pure
      [ D.p_
          [ text_ "This subsection will be about "
          , D.span (D.Class !:= "font-bold")
              [ text_ "Biasing a side of sampling" ]
          , text_ "."
          ]
      ]
  }
