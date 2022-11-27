module Pages.CoreConcepts.State.TheStateHook.UsingTheHookInText where

import Prelude


import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

usingTheHookInText :: forall lock payload. Subsection lock payload
usingTheHookInText = subsection
  { title: "Using the hook in text"
  , matter: pure
      [ D.p_
          [ text_ "This subsection will be about "
          , D.span (D.Class !:= "font-bold") [ text_ "Using the hook in text" ]
          , text_ "."
          ]
      ]
  }
