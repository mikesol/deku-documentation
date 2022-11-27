module Pages.FRP.Behaviors.Definition.TheBehaviorType where

import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

theBehaviorType :: forall lock payload. Subsection lock payload
theBehaviorType = subsection
  { title: "The Behavior type"
  , matter:
      [ D.p_
          [ text_ "This subsection will be about "
          , D.span (D.Class !:= "font-bold") [ text_ "The Behavior type" ]
          , text_ "."
          ]
      ]
  }
