module Pages.FRP.Events.StandAloneEvents.TheMakeEventFunction where

import Prelude


import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

theMakeEventFunction :: forall lock payload. Subsection lock payload
theMakeEventFunction = subsection
  { title: "The makeEvent function"
  , matter: pure
      [ D.p_
          [ text_ "This subsection will be about "
          , D.span (D.Class !:= "font-bold") [ text_ "The makeEvent function" ]
          , text_ "."
          ]
      ]
  }
