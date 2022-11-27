module Pages.FRP.Alternatives.Plus.Emptiness where

import Prelude

import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

emptiness :: forall lock payload. Subsection lock payload
emptiness = subsection
  { title: "Emptiness"
  , matter: pure
      [ D.p_
          [ text_ "This subsection will be about "
          , D.span (D.Class !:= "font-bold") [ text_ "Emptiness" ]
          , text_ "."
          ]
      ]
  }
