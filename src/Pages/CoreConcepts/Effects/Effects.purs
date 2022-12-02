module Pages.CoreConcepts.Effects.BindingToEffects where

import Prelude

import Contracts (Section, section)
import Deku.Attribute ((!:=))
import Deku.Control (text_)
import Deku.DOM as D
import Pages.CoreConcepts.Effects.Aff.TriggerAff (triggerAff)
import Pages.CoreConcepts.Effects.Aff.TriggerAffInParallel (triggerAffInParallel)
import Pages.CoreConcepts.Effects.Aff.TriggerAffWithCancellation (triggerAffWithCancellation)
import Pages.CoreConcepts.Effects.Aff.TriggerEffect (triggerEffect)

bindingToEffects :: forall lock payload. Section lock payload
bindingToEffects = section
  { title: "Binding to effects"
  , topmatter: pure
      [ D.p_
          [ text_ "This section will be about "
          , D.span (D.Class !:= "font-bold") [ text_ "Aff" ]
          , text_ "Aff."
          ]
      ]
  , subsections:
      [ triggerEffect
      , triggerAff
      , triggerAffWithCancellation
      , triggerAffInParallel
      ]
  }
