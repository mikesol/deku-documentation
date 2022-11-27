module Pages.CoreConcepts.State.TheStateHook.UsingTheHookInAnAttribute where

import Prelude

import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

usingTheHookInAnAttribute :: forall lock payload. Subsection lock payload
usingTheHookInAnAttribute = subsection
  { title: "Using the hook in an attribute"
  , matter: pure
      [ D.p_
          [ text_ "This subsection will be about "
          , D.span (D.Class !:= "font-bold")
              [ text_ "Using the hook in an attribute" ]
          , text_ "."
          ]
      ]
  }
