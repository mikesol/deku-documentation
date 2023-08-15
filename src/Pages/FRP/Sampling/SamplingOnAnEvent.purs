module Pages.FRP.Sampling.SamplingOnAnEvent where

import Prelude

import Components.TargetedLink (targetedLink)
import Contracts (Section, section)
import Deku.Control (text, text_)
import Deku.DOM as D
import Pages.FRP.Sampling.SamplingOnAnEvent.ApplicativesAndTemporality (applicativesAndTemporality)
import Pages.FRP.Sampling.SamplingOnAnEvent.BiasingASideOfSampling (biasingASideOfSampling)
import Pages.FRP.Sampling.SamplingOnAnEvent.FlippingTheFunctionAndArgument (flippingTheFunctionAndArgument)

samplingOnAnEvent :: Section
samplingOnAnEvent = section
  { title: "Sampling an event"
  , topmatter: pure
      [ D.p_
          [ text
              "This section will look at the basic mechanisms for sampling, exploring the various functions available in "
          , targetedLink "https://github.com/mikesol/purescript-hyrule"
              [ D.code__ "purescript-hyrule" ]
          , text_ " as well as some important corner cases to be aware of."
          ]
      ]
  , subsections:
      [ applicativesAndTemporality
      , flippingTheFunctionAndArgument
      , biasingASideOfSampling

      ]
  }
