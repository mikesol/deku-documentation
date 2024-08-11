module Pages.FRP.Sampling.SamplingWithBehaviors.GatingEventsOnPolls where

import Prelude

import Contracts (CollapseState(..), Subsection, getExample, subsection)
import Data.Maybe (Maybe(..))
import Deku.Control (text_)
import Deku.DOM as D
import Examples as Examples

gatingEventsOnPolls :: Subsection
gatingEventsOnPolls = subsection
  { title: "Gating events on polls"
  , matter: do
      example <- getExample StartCollapsed Nothing Examples.GatingEventsOnPolls
      pure
        [ D.p_
            [ D.span__
                "In the previous section, we saw examples of network calls being pushed to the boundary. But you can push entire effect systems to the boundary. To do that, we’ll use combinators like "
            , D.code__ "withTime"
            , D.span__ " and "
            , D.code__ "withRandom"
            , D.span__
                "s. We'll stitch them together using function composition."
            ]
        , D.p_
            [ text_
                "In the example below, we’ll make a gate using the mouse position. The mouse will pause the flicker when it's on the right side of the screen (sorry if you’re on mobile, no 🐁 for you!), and otherwise the flicker will continue between random hues of a similar color. Aside from my mad HTML rave skillz, the important thing to note here is how two combinators - the mouse and the randomness - are combined into a smöl effect system using function composition."
            ]
        , example
        ]
  }
