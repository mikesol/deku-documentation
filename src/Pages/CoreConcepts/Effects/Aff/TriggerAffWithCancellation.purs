module Pages.CoreConcepts.Effects.Aff.TriggerAffWithCancellation where

import Prelude

import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

triggerAffWithCancellation
  :: forall lock payload. Subsection lock payload
triggerAffWithCancellation = subsection
  { title: "The bindToAffWithCancellation function"
  , matter: pure
      [ D.p_
          [ text_ "This subsection will be about "
          , D.span (D.Class !:= "font-bold")
              [ text_ "Triggering a pushers from asynchronous code" ]
          , text_ "."
          ]
      ]
  }
