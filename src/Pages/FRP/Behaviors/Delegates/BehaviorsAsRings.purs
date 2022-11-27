module Pages.FRP.Behaviors.Delegates.BehaviorsAsRings where

import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

behaviorsAsRings :: forall lock payload. Subsection lock payload
behaviorsAsRings = subsection
  { title: "Behaviors as rings"
  , matter:
      [ D.p_
          [ text_ "This subsection will be about "
          , D.span (D.Class !:= "font-bold") [ text_ "Behaviors as rings" ]
          , text_ "."
          ]
      ]
  }
