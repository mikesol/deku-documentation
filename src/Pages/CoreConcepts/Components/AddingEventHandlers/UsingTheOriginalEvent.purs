module Pages.CoreConcepts.Components.AddingEventHandlers.UsingTheOriginalEvent where

import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

usingTheOriginalEvent :: forall lock payload. Subsection lock payload
usingTheOriginalEvent = subsection
  { title: "Using the original event"
  , matter:
      [ D.p_
          [ text_ "This subsection will be about "
          , D.span (D.Class !:= "font-bold")
              [ text_ "Using the original event" ]
          , text_ "."
          ]
      ]
  }
