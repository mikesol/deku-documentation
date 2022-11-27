module Pages.FRP.FixAndFold.FixingEvents.Gotchyas where

import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

gotchyas :: forall lock payload. Subsection lock payload
gotchyas = subsection
  { title: "Gotchyas"
  , matter:
      [ D.p_
          [ text_ "This subsection will be about "
          , D.span (D.Class !:= "font-bold") [ text_ "Gotchyas" ]
          , text_ "."
          ]
      ]
  }
