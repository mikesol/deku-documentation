module Pages.CoreConcepts.Pursx.DynamicAttributes where

import Contracts (Section, section)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D
import Pages.CoreConcepts.Pursx.DynamicAttributes.AddingAnAttribute (addingAnAttribute)
import Pages.CoreConcepts.Pursx.DynamicAttributes.AddingSeveralAttributes (addingSeveralAttributes)

dynamicAttributes :: forall lock payload. Section lock payload
dynamicAttributes = section
  { title: "DynamicAttributes"
  , topmatter:
      [ D.p_
          [ text_ "This section will be about "
            , D.span (D.Class !:= "font-bold") [ text_ "DynamicAttributes"]
            , text_ "."
          ]
      ]
  , subsections:
      [ addingAnAttribute,addingSeveralAttributes]
  }
