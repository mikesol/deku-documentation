module Pages.FRP.Sampling.SamplingWithPolls.SamplingAPollAndDiscardingTheEvent where

import Prelude

import Contracts (CollapseState(..), Subsection, getExample, subsection)
import Data.Maybe (Maybe(..))
import Deku.Control (text, text_)
import Deku.DOM as D
import Examples as Examples

samplingAPollAndDiscardingTheEvent
  :: Subsection
samplingAPollAndDiscardingTheEvent = subsection
  { title: "Sampling a poll and discarding the event"
  , matter: do
      samplePoll <- getExample StartCollapsed (Just "h-96")
        Examples.SamplingAPollAndDiscardingTheEvent
      pure
        [ D.p_
            [ text_
                "We can also sample a poll and discard the event via "
            , D.code__ "sample_"
            , text_
                ". Here's the same example above (with a bit slower of a rate to avoid killing the API!) using that technique."
            ]
        , samplePoll
        ]
  }
