module Pages.CoreConcepts.Components.AddingAttributes.ASingleAttribute where

import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

aSingleAttribute :: forall lock payload. Subsection lock payload
aSingleAttribute = subsection
  { title: "A single attribute"
  , matter:
      [ D.p_
          [ text_ "This subsection will be about "
          , D.span (D.Class !:= "font-bold") [ text_ "A single attribute" ]
          , text_ "."
          ]
      ]
  }
