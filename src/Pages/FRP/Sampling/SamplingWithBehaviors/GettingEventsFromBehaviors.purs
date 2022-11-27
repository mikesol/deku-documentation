module Pages.FRP.Sampling.SamplingWithBehaviors.GettingEventsFromBehaviors where

import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

gettingEventsFromBehaviors :: forall lock payload. Subsection lock payload
gettingEventsFromBehaviors = subsection
  { title: "Getting events from behaviors"
  , matter:
      [ D.p_
          [ text_ "This subsection will be about "
          , D.span (D.Class !:= "font-bold")
              [ text_ "Getting events from behaviors" ]
          , text_ "."
          ]
      ]
  }
