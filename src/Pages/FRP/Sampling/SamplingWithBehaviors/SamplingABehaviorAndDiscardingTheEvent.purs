module Pages.FRP.Sampling.SamplingWithBehaviors.SamplingABehaviorAndDiscardingTheEvent where

import Prelude

import Contracts (CollapseState(..), Subsection, getExample, subsection)
import Data.Maybe (Maybe(..))
import Deku.Control (text)
import Deku.DOM as D
import Examples as Examples

samplingABehaviorAndDiscardingTheEvent
  :: Subsection
samplingABehaviorAndDiscardingTheEvent = subsection
  { title: "Sampling a behavior and discarding the event"
  , matter: do 
      sampleBehavior <- getExample StartCollapsed (Just "h-96") Examples.SamplingABehaviorAndDiscardingTheEvent
      pure
        [ D.p_
            [ text
                "We can also sample a behavior and discard the event via "
            , D.code__ "sample_"
            , text
                ". Here's the same example above (with a bit slower of a rate to avoid killing the API!) using that technique."
            ]
        , sampleBehavior
        ]
  }
