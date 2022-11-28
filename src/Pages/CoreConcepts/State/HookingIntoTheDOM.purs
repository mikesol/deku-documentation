module Pages.CoreConcepts.State.HookingIntoTheDOM where

import Prelude

import Contracts (Section, section)
import Deku.DOM as D
import Pages.CoreConcepts.State.HookingIntoTheDOM.UsingAHookToControlThePresenceOfElements (usingAHookToControlThePresenceOfElements)
import Pages.CoreConcepts.State.HookingIntoTheDOM.UsingTheHookInAnAttribute (usingTheHookInAnAttribute)
import Pages.CoreConcepts.State.HookingIntoTheDOM.UsingTheHookToSwitchBetweenElements (usingTheHookToSwitchBetweenElements)

hookingIntoTheDOM :: forall lock payload. Section lock payload
hookingIntoTheDOM = section
  { title: "Hooking into the DOM"
  , topmatter: pure
      [ D.p__ "In addition to animating text, hooks can be used to control DOM attributes and DOM elements as well."
      ]
  , subsections:
      [ usingTheHookInAnAttribute
      , usingTheHookToSwitchBetweenElements
      , usingAHookToControlThePresenceOfElements
      ]
  }
