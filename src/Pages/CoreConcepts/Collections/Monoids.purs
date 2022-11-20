module Pages.CoreConcepts.Collections.Monoids where

import Contracts (Section, section)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D
import Pages.CoreConcepts.Collections.Monoids.ComponentsAsSemigroups (componentsAsSemigroups)
import Pages.CoreConcepts.Collections.Monoids.ComponentsAsMonoids (componentsAsMonoids)

monoids :: forall lock payload. Section lock payload
monoids = section
  { title: "Monoids"
  , topmatter:
      [ D.p_
          [ text_ "This section will be about "
            , D.span (D.Class !:= "font-bold") [ text_ "Monoids"]
            , text_ "."
          ]
      ]
  , subsections:
      [ componentsAsSemigroups,componentsAsMonoids]
  }
