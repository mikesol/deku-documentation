module Pages.FRP.Sampling.SamplingWithBehaviors.SamplingABehaviorWithACustomFunction where

import Prelude

import Contracts (CollapseState(..), Subsection, getExample, subsection)
import Data.Maybe (Maybe(..))
import Deku.Control (text)
import Deku.DOM as D
import Examples as Examples

samplingABehaviorWithACustomFunction
  :: Subsection
samplingABehaviorWithACustomFunction = subsection
  { title: "Sampling a behavior with a function"
  , matter: do
      sampleBehavior <- getExample StartCollapsed (Just "h-96") Examples.SamplingABehaviorWithACustomFunction
      pure
        [ D.p_
            [ text
                "Last but not least, we can sample an event with an arbitrary function using "
            , D.code__ "sampleBy"
            , text "."
            ]
        , sampleBehavior
        ]
  }
