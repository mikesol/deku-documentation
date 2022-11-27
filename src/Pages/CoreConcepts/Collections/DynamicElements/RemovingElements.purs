module Pages.CoreConcepts.Collections.DynamicElements.RemovingElements where

import Prelude


import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

removingElements :: forall lock payload. Subsection lock payload
removingElements = subsection
  { title: "Removing elements"
  , matter: pure
      [ D.p_
          [ text_ "This subsection will be about "
          , D.span (D.Class !:= "font-bold") [ text_ "Removing elements" ]
          , text_ "."
          ]
      ]
  }
