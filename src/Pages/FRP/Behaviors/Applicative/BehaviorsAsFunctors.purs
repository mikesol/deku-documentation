module Pages.FRP.Behaviors.Applicative.BehaviorsAsFunctors where

import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

behaviorsAsFunctors :: forall lock payload. Subsection lock payload
behaviorsAsFunctors = subsection
  { title: "Behaviors as functors"
  , matter:
      [ D.p_
          [ text_ "This subsection will be about "
          , D.span (D.Class !:= "font-bold") [ text_ "Behaviors as functors" ]
          , text_ "."
          ]
      ]
  }
