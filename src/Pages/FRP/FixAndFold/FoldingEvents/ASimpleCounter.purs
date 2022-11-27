module Pages.FRP.FixAndFold.FoldingEvents.ASimpleCounter where

import Prelude


import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

aSimpleCounter :: forall lock payload. Subsection lock payload
aSimpleCounter = subsection
  { title: "A simple counter"
  , matter: pure
      [ D.p_
          [ text_ "This subsection will be about "
          , D.span (D.Class !:= "font-bold") [ text_ "A simple counter" ]
          , text_ "."
          ]
      ]
  }
