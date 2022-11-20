module Pages.CoreConcepts.Components.AddingAttributes where

import Contracts (Section, section)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D
import Pages.CoreConcepts.Components.AddingAttributes.UsefulShorthand (usefulShorthand)
import Pages.CoreConcepts.Components.AddingAttributes.ASingleAttribute (aSingleAttribute)
import Pages.CoreConcepts.Components.AddingAttributes.RemovingTheUnderscore (removingTheUnderscore)
import Pages.CoreConcepts.Components.AddingAttributes.SeveralAttributes (severalAttributes)

addingAttributes :: forall lock payload. Section lock payload
addingAttributes = section
  { title: "AddingAttributes"
  , topmatter:
      [ D.p_
          [ text_ "This section will be about "
            , D.span (D.Class !:= "font-bold") [ text_ "AddingAttributes"]
            , text_ "."
          ]
      ]
  , subsections:
      [ usefulShorthand,aSingleAttribute,removingTheUnderscore,severalAttributes]
  }
