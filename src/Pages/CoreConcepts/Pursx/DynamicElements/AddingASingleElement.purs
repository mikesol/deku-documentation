module Pages.CoreConcepts.Pursx.DynamicElements.AddingASingleElement where

import Prelude

import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

addingASingleElement :: forall lock payload. Subsection lock payload
addingASingleElement = subsection
  { title: "Adding a single element"
  , matter: pure
      [ D.p_
          [ text_ "This subsection will be about "
          , D.span (D.Class !:= "font-bold") [ text_ "Adding a single element" ]
          , text_ "."
          ]
      ]
  }
