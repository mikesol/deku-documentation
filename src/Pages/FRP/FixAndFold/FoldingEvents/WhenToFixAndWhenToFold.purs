module Pages.FRP.FixAndFold.FoldingEvents.WhenToFixAndWhenToFold where

import Prelude


import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

whenToFixAndWhenToFold :: forall lock payload. Subsection lock payload
whenToFixAndWhenToFold = subsection
  { title: "When to fix and when to fold"
  , matter: pure
      [ D.p_
          [ text_ "This subsection will be about "
          , D.span (D.Class !:= "font-bold")
              [ text_ "When to fix and when to fold" ]
          , text_ "."
          ]
      ]
  }
