module Pages.FRP.Sampling.Gating where

import Prelude

import Contracts (Section, section)
import Deku.Attribute ((!:=))
import Deku.Control (text_)
import Deku.DOM as D
import Pages.FRP.Sampling.Gating.GatingEventsOnBehaviors (gatingEventsOnBehaviors)
import Pages.FRP.Sampling.Gating.SwitchingOnBehaviors (switchingOnBehaviors)

gating :: forall lock payload. Section lock payload
gating = section
  { title: "Gating"
  , topmatter: pure
      [ D.p_
          [ text_ "This section will be about "
          , D.span (D.Class !:= "font-bold") [ text_ "Gating" ]
          , text_ "."
          ]
      ]
  , subsections:
      [ gatingEventsOnBehaviors, switchingOnBehaviors ]
  }
