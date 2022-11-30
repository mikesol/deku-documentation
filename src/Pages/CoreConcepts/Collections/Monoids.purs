module Pages.CoreConcepts.Collections.Monoids where

import Prelude

import Contracts (Section, section)
import Deku.Control (text_)
import Deku.DOM as D
import Pages.CoreConcepts.Collections.Monoids.ComponentsAsSemigroups (componentsAsSemigroups)
import Pages.CoreConcepts.Collections.Monoids.ComponentsAsMonoids (componentsAsMonoids)

monoids :: forall lock payload. Section lock payload
monoids = section
  { title: "Monoids"
  , topmatter: pure
      [ D.p_
          [ text_ "Deku components are also ", D.b__ "Monoids", text_ ", which means they can be appended together. Furthermore, there is the empty component ", D.code__ "blank", text_ " that, when appended to any component, yields the component back."
          ]
      ]
  , subsections:
      [ componentsAsSemigroups, componentsAsMonoids ]
  }
