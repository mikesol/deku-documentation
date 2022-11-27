module Pages.CoreConcepts.Collections.FixedElements.GroupingElementsTogether where

import Prelude


import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

groupingElementsTogether :: forall lock payload. Subsection lock payload
groupingElementsTogether = subsection
  { title: "Grouping elements together"
  , matter: pure
      [ D.p_
          [ text_ "This subsection will be about "
          , D.span (D.Class !:= "font-bold")
              [ text_ "Grouping elements together" ]
          , text_ "."
          ]
      ]
  }
