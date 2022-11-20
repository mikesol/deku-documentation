module Pages.CoreConcepts.Effects.Callbacks where

import Contracts (Section, section)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D
import Pages.CoreConcepts.Effects.Callbacks.TriggeringACallbackFromAHandler (triggeringACallbackFromAHandler)
import Pages.CoreConcepts.Effects.Callbacks.TriggeringACallbackFromAsynchronousCode (triggeringACallbackFromAsynchronousCode)

callbacks :: forall lock payload. Section lock payload
callbacks = section
  { title: "Callbacks"
  , topmatter:
      [ D.p_
          [ text_ "This section will be about "
            , D.span (D.Class !:= "font-bold") [ text_ "Callbacks"]
            , text_ "."
          ]
      ]
  , subsections:
      [ triggeringACallbackFromAHandler,triggeringACallbackFromAsynchronousCode]
  }
