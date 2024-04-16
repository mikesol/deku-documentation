module Pages.FRP.Sampling where

import Prelude

import Components.TargetedLink (targetedLink)
import Contracts (Page, page)
import Deku.DOM.Attributes as DA
import Deku.Control (text_)
import Deku.DOM as D
import Pages.FRP.Sampling.SamplingOnAnEvent (samplingOnAnEvent)
import Pages.FRP.Sampling.SamplingWithPolls (samplingWithPolls)
import Router.ADT (Route(..))

sampling :: Page
sampling = page
  { route: Sampling
  , topmatter: pure
      [ D.p [ DA.klass_ "lead" ]
          [ text_ "What wouldn't we do in the name of purity? Probably a lot of stuff... But read on!"
          ]
      , D.p_
          [ text_
              "So far, our journey through FRP has focused on the pure, unadultered, unblemished, obsidian-black world of "
              , D.code__ "Event"
              , text_ "s and "
              , D.code__ "Poll"
              , text_ "s. But let's get real - one day, you're gonna have to make a network call. And when you do, you'll have to decide between doing something quick and dirty or going down the rabbit hole of effect systems. We hope you choose the second option, and this section is about the many wonderful 🐇🐇🐇 you'll find there!"
          ]
      ]
  , sections:
      [ samplingOnAnEvent, samplingWithPolls ]
  }
