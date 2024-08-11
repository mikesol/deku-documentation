module Pages.FRP.Sampling.SamplingWithPolls where

import Prelude

import Contracts (Section, section)
import Deku.Control (text_)
import Deku.DOM as D
import Pages.FRP.Sampling.SamplingWithBehaviors.GatingEventsOnPolls (gatingEventsOnPolls)
import Pages.FRP.Sampling.SamplingWithPolls.Multiplexing (multiplexing)
import Pages.FRP.Sampling.SamplingWithPolls.SamplingAPollWithAnEvent (samplingAPollWithAnEvent)

samplingWithPolls :: Section
samplingWithPolls = section
  { title: "Sampling the impure"
  , topmatter: do
      pure
        [ D.p_
            [ text_
                "Sometimes, you’ll want to sample something impure, like an API or radioactive emissions. This section will show a few strategies when purity is not an option (and let's be real, is it ever an option?)."
            ]
        ]
  , subsections:
      [ samplingAPollWithAnEvent
      , gatingEventsOnPolls
      , multiplexing
      ]
  }
