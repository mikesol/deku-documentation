module Pages.FRP.Sampling.SamplingWithPolls.SamplingAPollWithAnEvent where

import Prelude

import Components.Code (psCode)
import Contracts (CollapseState(..), Subsection, getExample, subsection)
import Data.Maybe (Maybe(..))
import Deku.Control (text, text_)
import Deku.DOM as D
import Examples as Examples

samplingAPollWithAnEvent :: Subsection
samplingAPollWithAnEvent = subsection
  { title: "Sampling a poll with an event"
  , matter: do
      samplePoll <- getExample StartCollapsed (Just "h-96")
        Examples.SamplingAPollWithAnEvent
      pure
        [ D.p_
            [ text_
                "Let's start by using an interval to sample an API call. We have two different types of effects here:"
            ]
        , D.ol_
            [ D.li_
                [ text_
                    "The interval is an "
                , D.i__ "ex nihilo"
                , text_
                    " effect, meaning that it speaks Latin. No, just kidding, it means that it doesn't depend on any other effect. It just happens, sort of like my forgetfulness or the hummus in my fridge disappearing."
                ]
            , D.li_
                [ text_
                    "The API call is a "
                , D.i__ "rider"
                , text_
                    " effect. It depends on the interval effect, because we want to poll the API every "
                , D.i__ "n"
                , text_ " seconds."
                ]
            ]
        , samplePoll
        ]
  }
