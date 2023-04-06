module Pages.CoreConcepts.Effects.Hydration where

import Prelude

import Contracts (Section, section)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D
import Pages.CoreConcepts.Effects.Hydration.InjectingDependencies (injectingDependencies)
import Pages.CoreConcepts.Effects.Hydration.Cleanup (cleanup)
import Pages.CoreConcepts.Effects.Hydration.AnAlternativeEffectModel (anAlternativeEffectModel)

hydration :: Section
hydration = section
  { title: "Hydration"
  , topmatter: pure
      [ D.p_
          [ text_
              "In Deku, components traditionally manage side effects by hydrating their children. Let's look at that what that means and how to implement it in practice."
          ]
      ]
  , subsections:
      [ anAlternativeEffectModel, injectingDependencies {-, cleanup -} ]
  }
