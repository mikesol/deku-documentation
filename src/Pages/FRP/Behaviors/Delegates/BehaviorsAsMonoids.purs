module Pages.FRP.Behaviors.OtherInstances.BehaviorsAsMonoids where

import Prelude


import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

behaviorsAsMonoids :: forall lock payload. Subsection lock payload
behaviorsAsMonoids = subsection
  { title: "Behaviors as monoids"
  , matter: pure
      [ D.p_
          [ text_ "This subsection will be about "
          , D.span (D.Class !:= "font-bold") [ text_ "Behaviors as monoids" ]
          , text_ "."
          ]
      ]
  }
