module Pages.FRP.FixAndFold.FoldingEvents.FoldIsState where

import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

foldIsState :: forall lock payload. Subsection lock payload
foldIsState = subsection
  { title: "Fold is state"
  , matter:
      [ D.p_
          [ text_ "This subsection will be about "
          , D.span (D.Class !:= "font-bold") [ text_ "Fold is state" ]
          , text_ "."
          ]
      ]
  }
