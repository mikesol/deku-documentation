module Pages.FRP.Filtering.Compact.WhyEventsCannotWither where

import Prelude


import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

whyEventsCannotWither :: forall lock payload. Subsection lock payload
whyEventsCannotWither = subsection
  { title: "Why events cannot wither"
  , matter: pure
      [ D.p_
          [ text_ "This subsection will be about "
          , D.span (D.Class !:= "font-bold")
              [ text_ "Why events cannot wither" ]
          , text_ "."
          ]
      ]
  }
