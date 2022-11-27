module Pages.CoreConcepts.Effects.LifecycleMethods where

import Prelude


import Contracts (Section, section)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D
import Pages.CoreConcepts.Effects.LifecycleMethods.EffectsOnTeardown (effectsOnTeardown)
import Pages.CoreConcepts.Effects.LifecycleMethods.EffectsOnInitialization (effectsOnInitialization)

lifecycleMethods :: forall lock payload. Section lock payload
lifecycleMethods = section
  { title: "Lifecycle methods"
  , topmatter: pure
      [ D.p_
          [ text_ "This section will be about "
          , D.span (D.Class !:= "font-bold") [ text_ "Lifecycle methods" ]
          , text_ "."
          ]
      ]
  , subsections:
      [ effectsOnTeardown, effectsOnInitialization ]
  }
