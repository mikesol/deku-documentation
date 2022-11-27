module Pages.FRP.OtherInstances.Ring.EventsAsSemirings where

import Prelude


import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

eventsAsSemirings :: forall lock payload. Subsection lock payload
eventsAsSemirings = subsection
  { title: "Events as semirings"
  , matter: pure
      [ D.p_
          [ text_ "This subsection will be about "
          , D.span (D.Class !:= "font-bold") [ text_ "Events as semirings" ]
          , text_ "."
          ]
      ]
  }
