module Pages.AdvancedUsage.CustomElements.DefiningCustomElements where

import Contracts (Section, section)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D
import Pages.AdvancedUsage.CustomElements.DefiningCustomElements.AddingCustomElementsToTheDOM (addingCustomElementsToTheDOM)
import Pages.AdvancedUsage.CustomElements.DefiningCustomElements.TheUnsafeCustomElementFunction (theUnsafeCustomElementFunction)

definingCustomElements :: forall lock payload. Section lock payload
definingCustomElements = section
  { title: "DefiningCustomElements"
  , topmatter:
      [ D.p_
          [ text_ "This section will be about "
            , D.span (D.Class !:= "font-bold") [ text_ "DefiningCustomElements"]
            , text_ "."
          ]
      ]
  , subsections:
      [ addingCustomElementsToTheDOM,theUnsafeCustomElementFunction]
  }
