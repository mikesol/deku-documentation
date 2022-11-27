module Pages.FRP.Busses.ASimpleBus.Uncurrying where

import Prelude

import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

uncurrying :: forall lock payload. Subsection lock payload
uncurrying = subsection
  { title: "Uncurrying"
  , matter: pure
      [ D.p_
          [ text_ "This subsection will be about "
          , D.span (D.Class !:= "font-bold") [ text_ "Uncurrying" ]
          , text_ "."
          ]
      ]
  }
