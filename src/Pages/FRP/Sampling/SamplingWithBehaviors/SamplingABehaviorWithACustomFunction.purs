module Pages.FRP.Sampling.SamplingWithPolls.SamplingAPollWithACustomFunction where

import Prelude

import Contracts (CollapseState(..), Subsection, getExample, subsection)
import Data.Maybe (Maybe(..))
import Deku.Control (text, text_)
import Deku.DOM as D
import Examples as Examples

samplingAPollWithACustomFunction
  :: Subsection
samplingAPollWithACustomFunction = subsection
  { title: "Sampling a poll with a function"
  , matter: do
      samplePoll <- getExample StartCollapsed (Just "h-96")
        Examples.SamplingAPollWithACustomFunction
      pure
        [ D.p_
            [ text_
                "Last but not least, we can sample an event with an arbitrary function using "
            , D.code__ "sampleBy"
            , text_ "."
            ]
        , samplePoll
        ]
  }
