module Pages.CoreConcepts.Collections.DynamicElements where

import Contracts (Section, section)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D
import Pages.CoreConcepts.Collections.DynamicElements.TheUseDynHook (theUseDynHook)
import Pages.CoreConcepts.Collections.DynamicElements.InsertingInADifferentOrder (insertingInADifferentOrder)
import Pages.CoreConcepts.Collections.DynamicElements.MovingElements (movingElements)
import Pages.CoreConcepts.Collections.DynamicElements.RemovingElements (removingElements)

dynamicElements :: forall lock payload. Section lock payload
dynamicElements = section
  { title: "DynamicElements"
  , topmatter:
      [ D.p_
          [ text_ "This section will be about "
            , D.span (D.Class !:= "font-bold") [ text_ "DynamicElements"]
            , text_ "."
          ]
      ]
  , subsections:
      [ theUseDynHook,insertingInADifferentOrder,movingElements,removingElements]
  }
