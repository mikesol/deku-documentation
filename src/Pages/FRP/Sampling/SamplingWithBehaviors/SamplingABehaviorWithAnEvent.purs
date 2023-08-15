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
      samplePoll <- getExample StartCollapsed (Just "h-96") Examples.SamplingAPollWithAnEvent
      pure [ D.p_
          [ text_
              "The easiest way to sample a poll with an event is to do what the signature of "
          , D.code__ "Poll"
          , text_
              " is inviting, nay enticing us to do, namely function application."
          ]
      , psCode
          """type Poll a = forall b. Event (a -> b) -> Event b
sample :: forall a b. Poll a -> Event (a -> b) -> Event b
sample = ($)"""
      , D.p_ [ D.b__ "tl;dr - sampling polls = $" ]
      , D.p_
          [ text_
              "Here's an example of an event that consults a random poll every two seconds. Note that the event sampling a \"random user poll\", meaning that the conceptual model is that at any time the service is measured, there's always a random user."
          ]
      , samplePoll
      ]
  }
