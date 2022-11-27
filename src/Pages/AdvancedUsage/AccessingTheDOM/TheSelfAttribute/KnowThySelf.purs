module Pages.AdvancedUsage.AccessingTheDOM.TheSelfAttribute.KnowThySelf where

import Prelude

import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

knowThySelf :: forall lock payload. Subsection lock payload
knowThySelf = subsection
  { title: "Know thy Self"
  , matter: pure
      [ D.p_
          [ text_ "This subsection will be about "
          , D.span (D.Class !:= "font-bold") [ text_ "Know thy Self" ]
          , text_ "."
          ]
      ]
  }
