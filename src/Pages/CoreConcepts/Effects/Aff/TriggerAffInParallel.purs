module Pages.CoreConcepts.Effects.Aff.TriggerAffInParallel where

import Prelude

import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

triggerAffInParallel :: forall lock payload. Subsection lock payload
triggerAffInParallel = subsection
  { title: "The bindToAffParallel function"
  , matter: pure
      [ D.p_
          [ text_ "This subsection will be about "
          , D.span (D.Class !:= "font-bold")
              [ text_ "Triggering a pushers from a handler" ]
          , text_ "."
          ]
      ]
  }
