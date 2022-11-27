module Pages.FRP.Sampling.SamplingOnAnEvent.FlippingTheFunctionAndArgument where

import Prelude

import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

flippingTheFunctionAndArgument :: forall lock payload. Subsection lock payload
flippingTheFunctionAndArgument = subsection
  { title: "Flipping the function and argument"
  , matter: pure
      [ D.p_
          [ text_ "This subsection will be about "
          , D.span (D.Class !:= "font-bold")
              [ text_ "Flipping the function and argument" ]
          , text_ "."
          ]
      ]
  }
