module Pages.CoreConcepts.Effects.Pusherss.TriggeringAPushersFromAsynchronousCode where

import Prelude

import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

triggeringAPushersFromAsynchronousCode
  :: forall lock payload. Subsection lock payload
triggeringAPushersFromAsynchronousCode = subsection
  { title: "Triggering a pushers from asynchronous code"
  , matter: pure
      [ D.p_
          [ text_ "This subsection will be about "
          , D.span (D.Class !:= "font-bold")
              [ text_ "Triggering a pushers from asynchronous code" ]
          , text_ "."
          ]
      ]
  }
