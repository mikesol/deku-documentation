module Pages.FRP.Behaviors.OtherInstances.BehaviorsAsHeytingAlgebras where

import Prelude


import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

behaviorsAsHeytingAlgebras :: forall lock payload. Subsection lock payload
behaviorsAsHeytingAlgebras = subsection
  { title: "Behaviors as Heyting Algebras"
  , matter: pure
      [ D.p_
          [ text_ "This subsection will be about "
          , D.span (D.Class !:= "font-bold")
              [ text_ "Behaviors as Heyting Algebras" ]
          , text_ "."
          ]
      ]
  }
