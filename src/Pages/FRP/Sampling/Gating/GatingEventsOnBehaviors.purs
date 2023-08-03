module Pages.FRP.Sampling.Gating.GatingEventsOnBehaviors where

import Prelude

import Components.Code (psCode)
import Contracts (CollapseState(..), Env(..), Subsection, getEnv, getExample, subsection)
import Data.Maybe (Maybe(..))
import Deku.Control (text)
import Deku.DOM as D
import Examples as Examples
import Router.ADT (Route(..))

gatingEventsOnBehaviors :: Subsection
gatingEventsOnBehaviors = subsection
  { title: "Gating events on behaviors"
  , matter: do
      Env { routeLink } <- getEnv
      example <- getExample StartCollapsed Nothing Examples.GatingEventsOnBehaviors
      pure [ D.p_
          [ text "We can gate events on behaviors by using the "
          , D.code__ "gateBy"
          , text " function."
          ]
      , psCode
          """gateBy :: forall event p a. Filterable event => (p -> a -> Boolean) -> ABehavior event p -> event a -> event a
gateBy f ps xs = compact (sampleBy (\p x -> if f p x then Just x else Nothing) ps xs)"""
      , D.p_
          [ text "Let's use the same strobe example as in the "
          , routeLink Alternatives
          , text
              " section, except we'll pause the strobe every two seconds via a gate. The current time will be provided by a "
          , D.code__ "Behavior"
          , text "."
          ]
      ,example
      ]
  }
