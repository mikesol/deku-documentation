module Pages.FRP.Sampling.Gating where

import Prelude

import Contracts (Env(..), Section, section)
import Deku.Attribute ((!:=))
import Deku.Control (text_)
import Deku.DOM as D
import Pages.FRP.Sampling.Gating.GatingEventsOnBehaviors (gatingEventsOnBehaviors)
import Pages.FRP.Sampling.Gating.SwitchingOnBehaviors (switchingOnBehaviors)
import Router.ADT (Route(..))

gating :: forall lock payload. Section lock payload
gating = section
  { title: "Gating"
  , topmatter: \(Env { routeLink }) ->
      [ D.p_
          [ text_ "A close cousin of sampling is "
          , D.b__ "gating"
          , text_
              " whereby an event's emission is gated by the value of a behavior. This is a close cousin of "
          , routeLink Filtering
          , text_
              " with the difference that the filter is dynamic instead of static."
          ]
      ]
  , subsections:
      [ gatingEventsOnBehaviors, switchingOnBehaviors ]
  }
