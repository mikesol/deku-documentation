module Pages.CoreConcepts.Pursx.ASimpleExample.TypeSafety where

import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

typeSafety :: forall lock payload. Subsection lock payload
typeSafety = subsection
  { title: "Type safety"
  , matter:
      [ D.p_
          [ text_ "This subsection will be about "
          , D.span (D.Class !:= "font-bold") [ text_ "Type safety" ]
          , text_ "."
          ]
      ]
  }
