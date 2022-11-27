module Pages.CoreConcepts.Components.ASimpleComponent.WhatsInD where

import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

whatsInD :: forall lock payload. Subsection lock payload
whatsInD = subsection
  { title: "What's in D?"
  , matter:
      [ D.p_
          [ text_ "This subsection will be about "
          , D.span (D.Class !:= "font-bold") [ text_ "What's in D?" ]
          , text_ "."
          ]
      ]
  }
