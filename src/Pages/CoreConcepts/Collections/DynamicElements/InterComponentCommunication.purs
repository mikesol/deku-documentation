module Pages.CoreConcepts.Collections.DynamicElements.InterComponentCommunication where

import Prelude

import Contracts (CollapseState(..), Env(..), Subsection, getEnv, getExample, subsection)
import Data.Maybe (Maybe(..))
import Deku.Control (text)
import Deku.DOM as D
import Examples as Examples
import Router.ADT (Route(..))

interComponentCommunication :: Subsection
interComponentCommunication = subsection
  { title: "Inter-component communication"
  , matter:  do
      Env { routeLink } <- getEnv
      example <- getExample StartCollapsed Nothing
        Examples.InterComponentCommunication
      pure [ D.p_
          [ text
              "Sometimes, you need to communicate between components in a dynamic structure. As we've seen in other examples, this possible by pushing to a hook at a higher level and subscribing to that hook at a lower level. However, because "
          , D.code__ "sendTo"
          , text " and "
          , D.code__ "remove"
          , text " are "
          , D.code__ "Effect"
          , text "s and not "
          , D.code__ "Event"
          , text
              "s, we can only use them in a listener. If we want to use them in conjunction with a hook, like for example using a hook to delete all items, we need to use the "
          , D.code__ "useEffect"
          , text " hook that you'll learn about a bit later."
          ]
      , example
      , D.p_
          [ text
              "Using these patterns, you can implement 99.87% of DOM business logic. We'll get to the remaining bits in the "
          , routeLink Portals
          , text " and "
          , routeLink CustomElements
          , text " sections."
          ]
      ]
  }
