module Pages.AdvancedUsage.CustomElements.DefiningCustomElements where

import Prelude

import Contracts (Section, section)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D
import Pages.AdvancedUsage.CustomElements.DefiningCustomElements.AddingCustomElementsToTheDOM (addingCustomElementsToTheDOM)
import Pages.AdvancedUsage.CustomElements.DefiningCustomElements.TheUnsafeCustomElementFunction (theUnsafeCustomElementFunction)

definingCustomElements :: forall lock payload. Section lock payload
definingCustomElements = section
  { title: "Defining custom elements"
  , topmatter: pure
      [ D.p_
          [ text_ "This section will be about "
          , D.span (D.Class !:= "font-bold")
              [ text_ "Defining custom elements" ]
          , text_ "."
          ]
      ]
  , subsections:
      [ theUnsafeCustomElementFunction, addingCustomElementsToTheDOM ]
  }
