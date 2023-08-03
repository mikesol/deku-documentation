module Pages.FRP.Sampling.SamplingWithBehaviors.SamplingABehaviorWithAnEvent where

import Prelude

import Components.Code (psCode)
import Contracts (CollapseState(..), Subsection, getExample, subsection)
import Data.Maybe (Maybe(..))
import Deku.Control (text)
import Deku.DOM as D
import Examples as Examples

samplingABehaviorWithAnEvent :: Subsection
samplingABehaviorWithAnEvent = subsection
  { title: "Sampling a behavior with an event"
  , matter: do
      sampleBehavior <- getExample StartCollapsed (Just "h-96") Examples.SamplingABehaviorWithAnEvent
      pure [ D.p_
          [ text
              "The easiest way to sample a behavior with an event is to do what the signature of "
          , D.code__ "Behavior"
          , text
              " is inviting, nay enticing us to do, namely function application."
          ]
      , psCode
          """type Behavior a = forall b. Event (a -> b) -> Event b
sample :: forall a b. Behavior a -> Event (a -> b) -> Event b
sample = ($)"""
      , D.p_ [ D.b__ "tl;dr - sampling behaviors = $" ]
      , D.p_
          [ text
              "Here's an example of an event that consults a random behavior every two seconds. Note that the event sampling a \"random user behavior\", meaning that the conceptual model is that at any time the service is measured, there's always a random user."
          ]
      , sampleBehavior
      ]
  }
