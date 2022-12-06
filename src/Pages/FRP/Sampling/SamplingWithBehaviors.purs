module Pages.FRP.Sampling.SamplingWithBehaviors where

import Prelude

import Contracts (Section, section)
import Deku.Attribute ((!:=))
import Deku.Control (text_)
import Deku.DOM as D
import Pages.FRP.Sampling.SamplingWithBehaviors.SamplingABehaviorAndDiscardingTheEvent (samplingABehaviorAndDiscardingTheEvent)
import Pages.FRP.Sampling.SamplingWithBehaviors.SamplingABehaviorWithACustomFunction (samplingABehaviorWithACustomFunction)
import Pages.FRP.Sampling.SamplingWithBehaviors.SamplingABehaviorWithAnEvent (samplingABehaviorWithAnEvent)

samplingWithBehaviors :: forall lock payload. Section lock payload
samplingWithBehaviors = section
  { title: "Sampling with behaviors"
  , topmatter: pure
      [ D.p_
          [ text_ "This section will be about "
          , D.span (D.Class !:= "font-bold") [ text_ "SamplingWithBehaviors" ]
          , text_ "."
          ]
      ]
  , subsections:
      [ samplingABehaviorWithAnEvent, samplingABehaviorAndDiscardingTheEvent, samplingABehaviorWithACustomFunction ]
  }
