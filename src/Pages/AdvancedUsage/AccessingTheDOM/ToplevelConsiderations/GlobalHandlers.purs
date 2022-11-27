module Pages.AdvancedUsage.AccessingTheDOM.ToplevelConsiderations.GlobalHandlers where

import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

globalHandlers :: forall lock payload. Subsection lock payload
globalHandlers = subsection
  { title: "Global handlers"
  , matter:
      [ D.p_
          [ text_ "This subsection will be about "
          , D.span (D.Class !:= "font-bold") [ text_ "Global handlers" ]
          , text_ "."
          ]
      ]
  }
