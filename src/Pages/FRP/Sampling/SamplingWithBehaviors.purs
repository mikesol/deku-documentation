module Pages.FRP.Sampling.SamplingWithBehaviors where

import Prelude

import Contracts (Section, section)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D
import Pages.FRP.Sampling.SamplingWithBehaviors.SwitchingBehaviorsUsingEvents (switchingBehaviorsUsingEvents)
import Pages.FRP.Sampling.SamplingWithBehaviors.GettingEventsFromBehaviors (gettingEventsFromBehaviors)

samplingWithBehaviors :: forall lock payload. Section lock payload
samplingWithBehaviors = section
  { title: "SamplingWithBehaviors"
  , topmatter: pure
      [ D.p_
          [ text_ "This section will be about "
          , D.span (D.Class !:= "font-bold") [ text_ "SamplingWithBehaviors" ]
          , text_ "."
          ]
      ]
  , subsections:
      [ switchingBehaviorsUsingEvents, gettingEventsFromBehaviors ]
  }
