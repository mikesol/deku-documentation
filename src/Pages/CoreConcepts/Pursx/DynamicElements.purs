module Pages.CoreConcepts.Pursx.DynamicElements where

import Prelude


import Contracts (Section, section)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D
import Pages.CoreConcepts.Pursx.DynamicElements.AddingSeveralElements (addingSeveralElements)
import Pages.CoreConcepts.Pursx.DynamicElements.AddingASingleElement (addingASingleElement)

dynamicElements :: forall lock payload. Section lock payload
dynamicElements = section
  { title: "Dynamic elements"
  , topmatter: pure
      [ D.p_
          [ text_ "This section will be about "
          , D.span (D.Class !:= "font-bold") [ text_ "Dynamic elements" ]
          , text_ "."
          ]
      ]
  , subsections:
      [ addingSeveralElements, addingASingleElement ]
  }
