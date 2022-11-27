module Pages.CoreConcepts.Effects.Riders where

import Contracts (Section, section)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D
import Pages.CoreConcepts.Effects.Riders.EffectsOnTeardown (effectsOnTeardown)
import Pages.CoreConcepts.Effects.Riders.EffectsOnInitialization (effectsOnInitialization)

riders :: forall lock payload. Section lock payload
riders = section
  { title: "Riders"
  , topmatter:
      [ D.p_
          [ text_ "This section will be about "
          , D.span (D.Class !:= "font-bold") [ text_ "Riders" ]
          , text_ "."
          ]
      ]
  , subsections:
      [ effectsOnTeardown, effectsOnInitialization ]
  }
