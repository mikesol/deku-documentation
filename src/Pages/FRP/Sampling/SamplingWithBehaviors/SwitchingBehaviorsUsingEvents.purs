module Pages.FRP.Sampling.SamplingWithBehaviors.SwitchingBehaviorsUsingEvents where

import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

switchingBehaviorsUsingEvents :: forall lock payload. Subsection lock payload
switchingBehaviorsUsingEvents = subsection
  { title: "Switching behaviors using events"
  , matter:
      [ D.p_
          [ text_ "This subsection will be about "
          , D.span (D.Class !:= "font-bold")
              [ text_ "Switching behaviors using events" ]
          , text_ "."
          ]
      ]
  }
