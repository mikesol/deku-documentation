module Pages.FRP.Sampling.SamplingOnAnEvent where

import Prelude

import Contracts (Section, section)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D
import Pages.FRP.Sampling.SamplingOnAnEvent.BiasingASideOfSampling (biasingASideOfSampling)
import Pages.FRP.Sampling.SamplingOnAnEvent.ApplicativesAndTemporality (applicativesAndTemporality)
import Pages.FRP.Sampling.SamplingOnAnEvent.FlippingTheFunctionAndArgument (flippingTheFunctionAndArgument)

samplingOnAnEvent :: forall lock payload. Section lock payload
samplingOnAnEvent = section
  { title: "Sampling an event"
  , topmatter: pure
      [ D.p_
          [ text_ "This section will be about "
          , D.span (D.Class !:= "font-bold") [ text_ "SamplingOnAnEvent" ]
          , text_ "."
          ]
      ]
  , subsections:
      [ applicativesAndTemporality
      , flippingTheFunctionAndArgument
      , biasingASideOfSampling

      ]
  }
