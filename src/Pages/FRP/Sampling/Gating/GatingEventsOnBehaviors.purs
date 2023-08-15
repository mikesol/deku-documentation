module Pages.FRP.Sampling.Gating.GatingEventsOnPolls where

import Prelude

import Components.Code (psCode)
import Contracts (CollapseState(..), Env(..), Subsection, getEnv, getExample, subsection)
import Data.Maybe (Maybe(..))
import Deku.Control (text, text_)
import Deku.DOM as D
import Examples as Examples
import Router.ADT (Route(..))

gatingEventsOnPolls :: Subsection
gatingEventsOnPolls = subsection
  { title: "Gating events on polls"
  , matter: do
      Env { routeLink } <- getEnv
      example <- getExample StartCollapsed Nothing Examples.GatingEventsOnPolls
      pure [ D.p_
          [ text_ "We can gate events on polls by using the "
          , D.code__ "gateBy"
          , text_ " function."
          ]
      , psCode
          """gateBy :: forall event p a. Filterable event => (p -> a -> Boolean) -> APoll event p -> event a -> event a
gateBy f ps xs = compact (sampleBy (\p x -> if f p x then Just x else Nothing) ps xs)"""
      , D.p_
          [ text_ "Let's use the same strobe example as in the "
          , routeLink Alternatives
          , text_
              " section, except we'll pause the strobe every two seconds via a gate. The current time will be provided by a "
          , D.code__ "Poll"
          , text_ "."
          ]
      ,example
      ]
  }
