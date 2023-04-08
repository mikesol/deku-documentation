module Pages.FRP.Sampling where

import Prelude

import Components.TargetedLink (targetedLink)
import Contracts (Page, page)
import Deku.Attribute ((!:=))
import Deku.Control (text_)
import Deku.DOM as D
import Pages.FRP.Sampling.Gating (gating)
import Pages.FRP.Sampling.SamplingOnAnEvent (samplingOnAnEvent)
import Pages.FRP.Sampling.SamplingWithBehaviors (samplingWithBehaviors)
import Router.ADT (Route(..))

sampling :: Page
sampling = page
  { route: Sampling
  , topmatter: pure
      [ D.p [D.Class !:= "lead"]
          [ text_ "Build your next "
          , targetedLink "https://www.youtube.com/watch?v=cvpMSXjR10M"
              [ text_ "sampler" ]
          , text_ " with FRP!"
          ]
      , D.p_
          [ text_
              "The only sampling we've seen so far in the world of events is the "
          , D.code__ "<*>"
          , text_
              " operator, where both events sample the most recent value of the other one in order to produce a value. However, sampling can go much further than this, and you can use it to build subtle combinations of reactive elements that precisely express your game logic or business logic."
          ]
      ]
  , sections:
      [ samplingOnAnEvent, samplingWithBehaviors, gating ]
  }
