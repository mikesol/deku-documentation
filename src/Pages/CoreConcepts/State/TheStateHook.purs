module Pages.CoreConcepts.State.TheStateHook where

import Contracts (Section, section)
import Deku.Attribute ((!:=))
import Deku.Control (text_)
import Deku.DOM as D
import Pages.CoreConcepts.State.TheStateHook.PushingToAHook (pushingToAHook)
import Pages.CoreConcepts.State.TheStateHook.UsingTheHookInAnAttribute (usingTheHookInAnAttribute)
import Pages.CoreConcepts.State.TheStateHook.UsingTheHookInText (usingTheHookInText)
import Pages.CoreConcepts.State.TheStateHook.UsingTheHookToSwitchBetweenElements (usingTheHookToSwitchBetweenElements)

theStateHook :: forall lock payload. Section lock payload
theStateHook = section
  { title: "The state hook"
  , topmatter:
      [ D.p_
          [ text_ "This section will be about "
          , D.span (D.Class !:= "font-bold") [ text_ "The state hook" ]
          , text_ "."
          ]
      ]
  , subsections:
      [ pushingToAHook
      , usingTheHookInText
      , usingTheHookInAnAttribute
      , usingTheHookToSwitchBetweenElements
      ]
  }
