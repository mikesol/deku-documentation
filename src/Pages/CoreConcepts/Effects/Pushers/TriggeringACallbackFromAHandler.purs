module Pages.CoreConcepts.Effects.Pusherss.TriggeringAPushersFromAHandler where

import Prelude

import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

triggeringAPushersFromAHandler :: forall lock payload. Subsection lock payload
triggeringAPushersFromAHandler = subsection
  { title: "Triggering a pushers from a handler"
  , matter: pure
      [ D.p_
          [ text_ "This subsection will be about "
          , D.span (D.Class !:= "font-bold")
              [ text_ "Triggering a pushers from a handler" ]
          , text_ "."
          ]
      ]
  }
