module Pages.FRP.Delegates.HeytingAlgebra.BooleanLogicOnEvents where

import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

booleanLogicOnEvents :: forall lock payload. Subsection lock payload
booleanLogicOnEvents = subsection
  { title: "Boolean logic on events"
  , matter:
      [ D.p_
          [ text_ "This subsection will be about "
          , D.span (D.Class !:= "font-bold") [ text_ "Boolean logic on events" ]
          , text_ "."
          ]
      ]
  }
