module Pages.CoreConcepts.Effects.BindingToEffects where

import Prelude

import Contracts (Section, section)
import Deku.Control (text, text_)
import Deku.DOM as D
import Pages.CoreConcepts.Effects.Aff.TriggerAff (triggerAff)
import Pages.CoreConcepts.Effects.Aff.TriggerAffInParallel (triggerAffInParallel)
import Pages.CoreConcepts.Effects.Aff.TriggerAffWithCancellation (triggerAffWithCancellation)
import Pages.CoreConcepts.Effects.Aff.TriggerEffect (triggerEffect)

bindingToEffects :: Section
bindingToEffects = section
  { title: "Binding to effects"
  , topmatter: pure
      [ D.p_
          [ text
              "This section explores the dark arts of tying hooks to side effects. It is a vile, unsavory practice that you should only indulge in sparingly. It's meant for hotfixes and emergencies when you cannot discern the control flow of an application and need to tie business logic to event streams."
          ]
      , D.p_
          [ text
              "Too much of this will make your app an unmaintainable mess, though, so when you have time to clean up that technical debt (ah, the lies we tell ourselves...), get rid of these methods!"
          ]
      ]
  , subsections:
      [ triggerEffect
      , triggerAffInParallel
      , triggerAff
      , triggerAffWithCancellation
      ]
  }
