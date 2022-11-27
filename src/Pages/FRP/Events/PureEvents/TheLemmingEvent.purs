module Pages.FRP.Events.PureEvents.TheLemmingEvent where

import Prelude


import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

theLemmingEvent :: forall lock payload. Subsection lock payload
theLemmingEvent = subsection
  { title: "The lemming event"
  , matter: pure
      [ D.p_
          [ text_ "This subsection will be about "
          , D.span (D.Class !:= "font-bold") [ text_ "The lemming event" ]
          , text_ "."
          ]
      ]
  }
