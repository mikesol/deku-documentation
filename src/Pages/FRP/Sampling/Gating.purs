module Pages.FRP.Sampling.Gating where

import Prelude

import Contracts (Env(..), Section, getEnv, section)
import Deku.Control (text, text_)
import Deku.DOM as D
import Pages.FRP.Sampling.Gating.GatingEventsOnPolls (gatingEventsOnPolls)
import Pages.FRP.Sampling.Gating.SwitchingOnPolls (switchingOnPolls)
import Router.ADT (Route(..))

gating :: Section
gating = section
  { title: "Gating"
  , topmatter: do
      Env { routeLink } <- getEnv
      pure [ D.p_
          [ text_ "A close cousin of sampling is "
          , D.b__ "gating"
          , text
              " whereby an event's emission is gated by the value of a poll. This is a close cousin of "
          , routeLink Filtering
          , text
              " with the difference that the filter is dynamic instead of static."
          ]
      ]
  , subsections:
      [ gatingEventsOnPolls, switchingOnPolls ]
  }
