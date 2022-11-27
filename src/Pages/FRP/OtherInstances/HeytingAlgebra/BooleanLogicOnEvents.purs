module Pages.FRP.OtherInstances.HeytingAlgebra.BooleanLogicOnEvents where

import Prelude


import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

booleanLogicOnEvents :: forall lock payload. Subsection lock payload
booleanLogicOnEvents = subsection
  { title: "Boolean logic on events"
  , matter: pure
      [ D.p_
          [ text_ "This subsection will be about "
          , D.span (D.Class !:= "font-bold") [ text_ "Boolean logic on events" ]
          , text_ "."
          ]
      ]
  }
