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
          [ text_
              "Deku provides lifecycle methods for times when applications need to run logic on component monuting or dismounting. This can be useful when you're porting an app from React (which you will no doubt do after reading this documentation) and need to emulate their conventions until you switch them for the objectively better Deku ones."
          ]
      ]
  , subsections:
      [ effectsOnInitialization, effectsOnTeardown ]
  }
