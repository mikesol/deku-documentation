module Pages.FRP.Sampling where

import Prelude

import Contracts (Page, page)
import Deku.Attribute ((!:=))
import Deku.Control (text_)
import Deku.DOM as D
import Pages.FRP.Sampling.Gating (gating)
import Pages.FRP.Sampling.SamplingOnAnEvent (samplingOnAnEvent)
import Pages.FRP.Sampling.SamplingWithBehaviors (samplingWithBehaviors)
import Router.ADT (Route(..))

sampling :: forall lock payload. Page lock payload
sampling = page
  { route: Sampling
  , topmatter: pure
      [ D.p (D.Class !:= "lead")
          [ text_ "This page will be about "
          , D.span (D.Class !:= "font-bold") [ text_ "Sampling" ]
          , text_ "."
          ]
      , D.p_
          [ text_
              "Possimus saepe veritatis sint nobis et quam eos. Architecto consequatur odit perferendis fuga eveniet possimus rerum cumque. Ea deleniti voluptatum deserunt voluptatibus ut non iste."
          ]
      ]
  , sections:
      [ samplingOnAnEvent, samplingWithBehaviors, gating ]
  }
