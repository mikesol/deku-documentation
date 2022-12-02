module Pages.CoreConcepts.Effects.Aff.TriggerAff where

import Prelude

import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

triggerAff :: forall lock payload. Subsection lock payload
triggerAff = subsection
  { title: "The bindToAff function"
  , matter: pure
      [ D.p_
          [ text_ "This subsection will be about "
          , D.span (D.Class !:= "font-bold")
              [ text_ "Triggering a pushers from a handler" ]
          , text_ "."
          ]
      ]
  }
