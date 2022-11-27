module Pages.CoreConcepts.Effects.Callbacks.TriggeringACallbackFromAHandler where

import Prelude


import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

triggeringACallbackFromAHandler :: forall lock payload. Subsection lock payload
triggeringACallbackFromAHandler = subsection
  { title: "Triggering a callback from a handler"
  , matter: pure
      [ D.p_
          [ text_ "This subsection will be about "
          , D.span (D.Class !:= "font-bold")
              [ text_ "Triggering a callback from a handler" ]
          , text_ "."
          ]
      ]
  }
