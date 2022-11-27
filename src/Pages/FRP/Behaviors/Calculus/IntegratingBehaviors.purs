module Pages.FRP.Behaviors.Calculus.IntegratingBehaviors where

import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

integratingBehaviors :: forall lock payload. Subsection lock payload
integratingBehaviors = subsection
  { title: "Integrating behaviors"
  , matter:
      [ D.p_
          [ text_ "This subsection will be about "
          , D.span (D.Class !:= "font-bold") [ text_ "Integrating behaviors" ]
          , text_ "."
          ]
      ]
  }
