module Pages.CoreConcepts.Collections.DynamicElements.InsertingInADifferentOrder where

import Prelude


import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

insertingInADifferentOrder :: forall lock payload. Subsection lock payload
insertingInADifferentOrder = subsection
  { title: "Inserting in a different order"
  , matter: pure
      [ D.p_
          [ text_ "This subsection will be about "
          , D.span (D.Class !:= "font-bold")
              [ text_ "Inserting in a different order" ]
          , text_ "."
          ]
      ]
  }
