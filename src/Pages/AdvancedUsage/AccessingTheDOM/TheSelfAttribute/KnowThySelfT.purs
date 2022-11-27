module Pages.AdvancedUsage.AccessingTheDOM.TheSelfAttribute.KnowThySelfT where

import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

knowThySelfT :: forall lock payload. Subsection lock payload
knowThySelfT = subsection
  { title: "Know thy SelfT"
  , matter:
      [ D.p_
          [ text_ "This subsection will be about "
          , D.span (D.Class !:= "font-bold") [ text_ "Know thy SelfT" ]
          , text_ "."
          ]
      ]
  }
