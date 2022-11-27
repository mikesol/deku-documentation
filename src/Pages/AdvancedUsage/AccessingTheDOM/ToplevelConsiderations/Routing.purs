module Pages.AdvancedUsage.AccessingTheDOM.ToplevelConsiderations.Routing where

import Prelude


import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

routing :: forall lock payload. Subsection lock payload
routing = subsection
  { title: "Routing"
  , matter: pure
      [ D.p_
          [ text_ "This subsection will be about "
          , D.span (D.Class !:= "font-bold") [ text_ "Routing" ]
          , text_ "."
          ]
      ]
  }
