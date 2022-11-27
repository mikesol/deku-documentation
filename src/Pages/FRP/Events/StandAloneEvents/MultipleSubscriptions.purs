module Pages.FRP.Events.StandAloneEvents.MultipleSubscriptions where

import Prelude


import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

multipleSubscriptions :: forall lock payload. Subsection lock payload
multipleSubscriptions = subsection
  { title: "Multiple subscriptions"
  , matter: pure
      [ D.p_
          [ text_ "This subsection will be about "
          , D.span (D.Class !:= "font-bold") [ text_ "Multiple subscriptions" ]
          , text_ "."
          ]
      ]
  }
