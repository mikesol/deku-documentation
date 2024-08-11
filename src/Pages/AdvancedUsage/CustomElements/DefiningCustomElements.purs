module Pages.AdvancedUsage.CustomElements.DefiningCustomElements where

import Prelude

import Contracts (Section, section)
import Deku.Control (text, text_)
import Deku.DOM as D
import Pages.AdvancedUsage.CustomElements.DefiningCustomElements.AddingCustomElementsToTheDOM (addingCustomElementsToTheDOM)
import Pages.AdvancedUsage.CustomElements.DefiningCustomElements.TheUnsafeCustomElementFunction (theUnsafeCustomElementFunction)

definingCustomElements :: Section
definingCustomElements = section
  { title: "Defining custom elements"
  , topmatter: pure
      [ D.p_
          [ text_
              "In this section, we’ll see how to take an element already in the DOM and give it a new alias through Deku."
          ]
      ]
  , subsections:
      [ theUnsafeCustomElementFunction, addingCustomElementsToTheDOM ]
  }
