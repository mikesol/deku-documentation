module Pages.CoreConcepts.Collections.DynamicElements.MovingElements where

import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

movingElements :: forall lock payload. Subsection lock payload
movingElements = subsection
  { title: "Moving elements"
  , matter:
      [ D.p_
          [ text_ "This subsection will be about "
          , D.span (D.Class !:= "font-bold") [ text_ "Moving elements" ]
          , text_ "."
          ]
      ]
  }
