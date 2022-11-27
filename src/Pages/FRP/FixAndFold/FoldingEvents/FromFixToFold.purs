module Pages.FRP.FixAndFold.FoldingEvents.FromFixToFold where

import Prelude


import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

fromFixToFold :: forall lock payload. Subsection lock payload
fromFixToFold = subsection
  { title: "From fix to fold"
  , matter: pure
      [ D.p_
          [ text_ "This subsection will be about "
          , D.span (D.Class !:= "font-bold") [ text_ "From fix to fold" ]
          , text_ "."
          ]
      ]
  }
