module Pages.CoreConcepts.Portals.GlobalPortals.PerformanceConsiderations where

import Prelude

import Contracts (Env(..), Subsection, getEnv, subsection)
import Deku.Control (text_)
import Deku.DOM as D
import Router.ADT (Route(..))

performanceConsiderations :: Subsection
performanceConsiderations = subsection
  { title: "Performance considerations"
  , matter: do
      Env { routeLink } <- getEnv
      pure
        [ D.p_
            [ text_ "As we learned in the "
            , routeLink State
            , text_ " section, hooks can hold terms of "
            , D.i__ "any"
            , text_
                " type. Hooks can even contain Deku components, which means that a component can be pushed to a pusher and sent to an event. For this reason, once a global portal is created, it can theoretically be injected anywhere in an application and thus must be kept alive for the lifespan of the application. In many scenarios, for example an in-app chat widget, this is fine. But in many scenarios, like if a portal exists in a list element, you’ll want the portal to be cleaned up when the element is cleaned up. For that, we have "
            , D.b__ "local portals"
            , text_
                ", which solve that problem at the expense of a slightly clunkier syntax."
            ]
        ]
  }
