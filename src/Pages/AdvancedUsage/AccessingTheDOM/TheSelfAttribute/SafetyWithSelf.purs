module Pages.AdvancedUsage.AccessingTheDOM.TheSelfAttribute.SafetyWithSelf where

import Prelude


import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

safetyWithSelf :: forall lock payload. Subsection lock payload
safetyWithSelf = subsection
  { title: "Safety with Self"
  , matter: pure
      [ D.p_
          [ text_ "This subsection will be about "
          , D.span (D.Class !:= "font-bold") [ text_ "Safety with Self" ]
          , text_ "."
          ]
      ]
  }
