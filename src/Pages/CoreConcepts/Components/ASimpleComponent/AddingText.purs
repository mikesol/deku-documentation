module Pages.CoreConcepts.Components.ASimpleComponent.AddingText where

import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

addingText :: forall lock payload. Subsection lock payload
addingText = subsection
  { title: "Adding text"
  , matter:
      [ D.p_
          [ text_ "This subsection will be about "
          , D.span (D.Class !:= "font-bold") [ text_ "Adding text" ]
          , text_ "."
          ]
      ]
  }
