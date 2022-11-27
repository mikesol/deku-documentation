module Pages.CoreConcepts.State.TheStateHook.UsingTheHookToSwitchBetweenElements where

import Prelude


import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

usingTheHookToSwitchBetweenElements
  :: forall lock payload. Subsection lock payload
usingTheHookToSwitchBetweenElements = subsection
  { title: "Using the hook to switch between elements"
  , matter: pure
      [ D.p_
          [ text_ "This subsection will be about "
          , D.span (D.Class !:= "font-bold")
              [ text_ "Using the hook to switch between elements" ]
          , text_ "."
          ]
      ]
  }
