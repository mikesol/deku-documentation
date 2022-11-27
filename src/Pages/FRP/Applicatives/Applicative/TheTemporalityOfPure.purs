module Pages.FRP.Applicatives.Applicative.TheTemporalityOfPure where

import Prelude


import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

theTemporalityOfPure :: forall lock payload. Subsection lock payload
theTemporalityOfPure = subsection
  { title: "The temporality of pure"
  , matter: pure
      [ D.p_
          [ text_ "This subsection will be about "
          , D.span (D.Class !:= "font-bold") [ text_ "The temporality of pure" ]
          , text_ "."
          ]
      ]
  }
