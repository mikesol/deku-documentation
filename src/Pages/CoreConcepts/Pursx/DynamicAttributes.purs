module Pages.CoreConcepts.Pursx.DynamicAttributes where

import Prelude

import Contracts (Section, section)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D
import Pages.CoreConcepts.Pursx.DynamicAttributes.AddingAnAttribute (addingAnAttribute)
import Pages.CoreConcepts.Pursx.DynamicAttributes.AddingSeveralAttributes (addingSeveralAttributes)

dynamicAttributes :: forall lock payload. Section lock payload
dynamicAttributes = section
  { title: "Dynamic attributes"
  , topmatter: pure
      [ D.p_
          [ text_ "This section will be about "
          , D.span (D.Class !:= "font-bold") [ text_ "Dynamic attributes" ]
          , text_ "."
          ]
      ]
  , subsections:
      [ addingAnAttribute, addingSeveralAttributes ]
  }
