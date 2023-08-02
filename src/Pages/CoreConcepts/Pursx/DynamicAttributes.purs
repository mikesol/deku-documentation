module Pages.CoreConcepts.Pursx.DynamicAttributes where

import Prelude

import Contracts (Section, section)
import Deku.Control (text)
import Deku.DOM as D
import Pages.CoreConcepts.Pursx.DynamicAttributes.AddingAnAttribute (addingAnAttribute)
import Pages.CoreConcepts.Pursx.DynamicAttributes.AddingSeveralAttributes (addingSeveralAttributes)

dynamicAttributes :: Section
dynamicAttributes = section
  { title: "Dynamic attributes"
  , topmatter: pure
      [ D.p_
          [ text
              "Let's bring our Pursx to live by adding some dynamic attributes. We'll modify the breadcrumbs example above with a hook that sets the presence or absence of a crumb based on a click listener."
          ]
      ]
  , subsections:
      [ addingAnAttribute, addingSeveralAttributes ]
  }
