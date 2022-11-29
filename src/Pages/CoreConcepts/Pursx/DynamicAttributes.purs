module Pages.CoreConcepts.Pursx.DynamicAttributes where

import Prelude

import Contracts (Section, section)
import Deku.Control (text_)
import Deku.DOM as D
import Pages.CoreConcepts.Pursx.DynamicAttributes.AddingAnAttribute (addingAnAttribute)
import Pages.CoreConcepts.Pursx.DynamicAttributes.AddingSeveralAttributes (addingSeveralAttributes)

dynamicAttributes :: forall lock payload. Section lock payload
dynamicAttributes = section
  { title: "Dynamic attributes"
  , topmatter: pure
      [ D.p_
          [ text_ "In addition to static DOM elements, Pursx also supports adding attributes. Let's modify the breadcrumbs example above with a hook that sets the presence or absence of a crumb based on a click listener."
          ]
      ]
  , subsections:
      [ addingAnAttribute, addingSeveralAttributes ]
  }
