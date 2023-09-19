module Pages.CoreConcepts.Collections.DynamicElements.TheUseDynHook where

import Prelude

import Contracts (CollapseState(..), Env(..), Subsection, getEnv, getExample, subsection)
import Data.Maybe (Maybe(..))
import Deku.Control (text, text_)
import Deku.DOM as D
import Examples as Examples
import Router.ADT (Route(..))

theUseDynHook :: Subsection
theUseDynHook = subsection
  { title: "The useDyn hook"
  , matter: do
      Env { routeLink } <- getEnv
      example <- getExample StartCollapsed Nothing Examples.UseDyn
      pure
        [ D.p_
            [ text_
                "To render dynamic components with the most recent component appearing at the top of a collection, look no further than the "
            , D.code__ "useDynAtBeginning"
            , text_ " hook. The hook takes an event and outputs a value called "
            , D.code__ "value"
            , text_
                " that can be used to render the most recent component. Here's an example:"
            ]
        , example
        , D.p_
            [ text_ "As we learned in "
            , routeLink State
            , text_ ", the right side of a state hook is of type "
            , D.code__ "Event a"
            , text_ ", where "
            , D.code__ "a"
            , text_ " is whatever's being pushed to the pusher. Because "
            , D.code__ "Event"
            , text_ " is a functor, we can "
            , D.code__ "map"
            , text_
                " over it. So far, we've been doing simple transformations like mapping over "
            , D.code__ "Event Int"
            , text_ " to turn it into "
            , D.code__ "Event String"
            , text_ ". Here, we're mapping over an "
            , D.code__ "Event"
            , text_
                " to transform it into a Deku component. So instead of streaming text to a text node, we're streaming components to the DOM, but it's the same pattern!"
            ]
        ]
  }
