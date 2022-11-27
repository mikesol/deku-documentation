module Pages.CoreConcepts.Pursx.DynamicAttributes.AddingAnAttribute where

import Prelude


import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

addingAnAttribute :: forall lock payload. Subsection lock payload
addingAnAttribute = subsection
  { title: "Adding an attribute"
  , matter: pure
      [ D.p_
          [ text_ "This subsection will be about "
          , D.span (D.Class !:= "font-bold") [ text_ "Adding an attribute" ]
          , text_ "."
          ]
      ]
  }
