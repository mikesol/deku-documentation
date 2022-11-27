module Pages.FRP.Events.PureEvents.WhatIsAnEventWithoutTime where

import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

whatIsAnEventWithoutTime :: forall lock payload. Subsection lock payload
whatIsAnEventWithoutTime = subsection
  { title: "What is an event without time?"
  , matter:
      [ D.p_
          [ text_ "This subsection will be about "
          , D.span (D.Class !:= "font-bold")
              [ text_ "What is an event without time?" ]
          , text_ "."
          ]
      ]
  }
