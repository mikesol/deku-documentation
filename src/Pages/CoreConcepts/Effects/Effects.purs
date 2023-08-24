module Pages.CoreConcepts.Effects.BindingToEffects where

import Prelude

import Contracts (Section, section)
import Deku.Control (text_)
import Deku.DOM as D
import Pages.CoreConcepts.Effects.Aff.TriggerAff (triggerAff)
import Pages.CoreConcepts.Effects.Aff.TriggerAffInParallel (triggerAffInParallel)
import Pages.CoreConcepts.Effects.Aff.TriggerAffWithCancellation (triggerAffWithCancellation)
import Pages.CoreConcepts.Effects.Aff.TriggerEffect (triggerEffect)

bindingToEffects :: Section
bindingToEffects = section
  { title: "Common effectful flows"
  , topmatter: pure
      [ D.p_
          [ text_
              "This section explores common effectful flows, like random number generators and calls to REST APIs, and how to achieve them by triggering these effects from outer scopes."
          ]
      ]
  , subsections:
      [ triggerEffect
      , triggerAffInParallel
      , triggerAff
      , triggerAffWithCancellation
      ]
  }
