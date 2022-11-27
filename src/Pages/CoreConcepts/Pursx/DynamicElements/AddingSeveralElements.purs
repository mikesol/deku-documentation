module Pages.CoreConcepts.Pursx.DynamicElements.AddingSeveralElements where

import Prelude


import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

addingSeveralElements :: forall lock payload. Subsection lock payload
addingSeveralElements = subsection
  { title: "Adding several elements"
  , matter: pure
      [ D.p_
          [ text_ "This subsection will be about "
          , D.span (D.Class !:= "font-bold") [ text_ "Adding several elements" ]
          , text_ "."
          ]
      ]
  }
