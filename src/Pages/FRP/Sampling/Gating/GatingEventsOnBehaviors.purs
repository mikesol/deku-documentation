module Pages.FRP.Sampling.Gating.GatingEventsOnBehaviors where

import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

gatingEventsOnBehaviors :: forall lock payload. Subsection lock payload
gatingEventsOnBehaviors = subsection
  { title: "Gating events on behaviors"
  , matter:
      [ D.p_
          [ text_ "This subsection will be about "
          , D.span (D.Class !:= "font-bold")
              [ text_ "Gating events on behaviors" ]
          , text_ "."
          ]
      ]
  }
