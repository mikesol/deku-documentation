module Pages.CoreConcepts.Pursx.DynamicElements where

import Prelude

import Contracts (Section, section)
import Deku.Control (text_)
import Deku.DOM as D
import Pages.CoreConcepts.Pursx.DynamicElements.AddingSeveralElements (addingSeveralElements)
import Pages.CoreConcepts.Pursx.DynamicElements.AddingASingleElement (addingASingleElement)

dynamicElements :: forall lock payload. Section lock payload
dynamicElements = section
  { title: "Dynamic elements"
  , topmatter: pure
      [ D.p_
          [ text_
              "Now that we've added dynamic attributes, let's add dynamic elements to our Pursx."
          ]
      ]
  , subsections:
      [ addingASingleElement, addingSeveralElements ]
  }
