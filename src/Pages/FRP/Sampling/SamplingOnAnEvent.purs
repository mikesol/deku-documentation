module Pages.FRP.Sampling.SamplingOnAnEvent where

import Contracts (Section, section)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D
import Pages.FRP.Sampling.SamplingOnAnEvent.BiasingASideOfSampling (biasingASideOfSampling)
import Pages.FRP.Sampling.SamplingOnAnEvent.SamplingApplicativesAndTemporality (samplingApplicativesAndTemporality)
import Pages.FRP.Sampling.SamplingOnAnEvent.FlippingTheFunctionAndArgument (flippingTheFunctionAndArgument)

samplingOnAnEvent :: forall lock payload. Section lock payload
samplingOnAnEvent = section
  { title: "SamplingOnAnEvent"
  , topmatter:
      [ D.p_
          [ text_ "This section will be about "
            , D.span (D.Class !:= "font-bold") [ text_ "SamplingOnAnEvent"]
            , text_ "."
          ]
      ]
  , subsections:
      [ biasingASideOfSampling,samplingApplicativesAndTemporality,flippingTheFunctionAndArgument]
  }
