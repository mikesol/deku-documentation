module Pages.CoreConcepts.State.TheStateHook where

import Contracts (Section, section)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D
import Pages.CoreConcepts.State.TheStateHook.UsingTheHookInText (usingTheHookInText)
import Pages.CoreConcepts.State.TheStateHook.UsingTheHookInAnAttribute (usingTheHookInAnAttribute)
import Pages.CoreConcepts.State.TheStateHook.PushingToAHook (pushingToAHook)

theStateHook :: forall lock payload. Section lock payload
theStateHook = section
  { title: "TheStateHook"
  , topmatter:
      [ D.p_
          [ text_ "This section will be about "
          , D.span (D.Class !:= "font-bold") [ text_ "TheStateHook" ]
          , text_ "."
          ]
      ]
  , subsections:
      [ usingTheHookInText, usingTheHookInAnAttribute, pushingToAHook ]
  }
