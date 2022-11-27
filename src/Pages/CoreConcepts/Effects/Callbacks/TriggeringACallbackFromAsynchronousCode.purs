module Pages.CoreConcepts.Effects.Callbacks.TriggeringACallbackFromAsynchronousCode where

import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

triggeringACallbackFromAsynchronousCode
  :: forall lock payload. Subsection lock payload
triggeringACallbackFromAsynchronousCode = subsection
  { title: "Triggering a callback from asynchronous code"
  , matter:
      [ D.p_
          [ text_ "This subsection will be about "
          , D.span (D.Class !:= "font-bold")
              [ text_ "Triggering a callback from asynchronous code" ]
          , text_ "."
          ]
      ]
  }
