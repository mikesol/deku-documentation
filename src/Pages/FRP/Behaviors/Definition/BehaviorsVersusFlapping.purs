module Pages.FRP.Behaviors.Definition.BehaviorsVersusFlapping where

import Prelude


import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

behaviorsVersusFlapping :: forall lock payload. Subsection lock payload
behaviorsVersusFlapping = subsection
  { title: "Behaviors versus flapping"
  , matter: pure
      [ D.p_
          [ text_ "This subsection will be about "
          , D.span (D.Class !:= "font-bold")
              [ text_ "Behaviors versus flapping" ]
          , text_ "."
          ]
      ]
  }
