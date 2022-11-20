module Pages.FRP.Sampling.Gating where

import Contracts (Section, section)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D
import Pages.FRP.Sampling.Gating.GatingEventsOnBehaviors (gatingEventsOnBehaviors)

gating :: forall lock payload. Section lock payload
gating = section
  { title: "Gating"
  , topmatter:
      [ D.p_
          [ text_ "This section will be about "
            , D.span (D.Class !:= "font-bold") [ text_ "Gating"]
            , text_ "."
          ]
      ]
  , subsections:
      [ gatingEventsOnBehaviors]
  }
