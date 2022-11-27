module Pages.CoreConcepts.Effects.Hydration where

import Prelude

import Contracts (Section, section)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D
import Pages.CoreConcepts.Effects.Hydration.InjectingDependencies (injectingDependencies)
import Pages.CoreConcepts.Effects.Hydration.Cleanup (cleanup)
import Pages.CoreConcepts.Effects.Hydration.AnAlternativeEffectModel (anAlternativeEffectModel)

hydration :: forall lock payload. Section lock payload
hydration = section
  { title: "Hydration"
  , topmatter: pure
      [ D.p_
          [ text_ "This section will be about "
          , D.span (D.Class !:= "font-bold") [ text_ "Hydration" ]
          , text_ "."
          ]
      ]
  , subsections:
      [ injectingDependencies, cleanup, anAlternativeEffectModel ]
  }
