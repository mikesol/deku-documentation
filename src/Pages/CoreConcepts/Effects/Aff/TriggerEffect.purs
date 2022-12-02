module Pages.CoreConcepts.Effects.Aff.TriggerEffect where

import Prelude

import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

triggerEffect :: forall lock payload. Subsection lock payload
triggerEffect = subsection
  { title: "The triggerEffect function"
  , matter: pure
      [ D.p_
          [ text_ "This subsection will be about "
          , D.span (D.Class !:= "font-bold")
              [ text_ "Triggering a pushers from a handler" ]
          , text_ "."
          ]
      ]
  }
