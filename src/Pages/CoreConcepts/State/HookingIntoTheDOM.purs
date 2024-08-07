module Pages.CoreConcepts.State.HookingIntoTheDOM where

import Prelude

import Contracts (Section, section)
import Deku.DOM as D
import Pages.CoreConcepts.State.HookingIntoTheDOM.UnsettingAnAttributeWithAHook (unsettingAnAttributeWithAHook)
import Pages.CoreConcepts.State.HookingIntoTheDOM.UsingAHookToControlThePresenceOfElements (usingAHookToControlThePresenceOfElements)
import Pages.CoreConcepts.State.HookingIntoTheDOM.HookInAnAttribute (usingTheHookInAnAttribute)
import Pages.CoreConcepts.State.HookingIntoTheDOM.SwitchBetweenElements (usingTheHookToSwitchBetweenElements)

hookingIntoTheDOM :: Section
hookingIntoTheDOM = section
  { title: "Hooking into the DOM"
  , topmatter: pure
      [ D.p__
          "In addition to animating text, hooks can be used to control DOM attributes and DOM elements as well."
      ]
  , subsections:
      [ usingTheHookInAnAttribute
      , unsettingAnAttributeWithAHook
      , usingTheHookToSwitchBetweenElements
      , usingAHookToControlThePresenceOfElements
      ]
  }
