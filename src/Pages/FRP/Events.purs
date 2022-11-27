module Pages.FRP.Events where

import Contracts (Page, page)
import Deku.Attribute ((!:=))
import Deku.Control (text_)
import Deku.DOM as D
import Pages.FRP.Events.Definition (definition)
import Pages.FRP.Events.InteractiveEvents (interactiveEvents)
import Pages.FRP.Events.OptimizedEvents (optimizedEvents)
import Pages.FRP.Events.PureEvents (pureEvents)
import Pages.FRP.Events.StandAloneEvents (standAloneEvents)
import Router.ADT (Route(..))

events :: forall lock payload. Page lock payload
events = page
  { route: Events
  , topmatter:
      [ D.p (D.Class !:= "lead")
          [ text_ "This page will be about "
          , D.span (D.Class !:= "font-bold") [ text_ "Events" ]
          , text_ "."
          ]
      , D.p_
          [ text_
              "Possimus saepe veritatis sint nobis et quam eos. Architecto consequatur odit perferendis fuga eveniet possimus rerum cumque. Ea deleniti voluptatum deserunt voluptatibus ut non iste."
          ]
      ]
  , sections:
      [ definition
      , interactiveEvents
      , standAloneEvents
      , pureEvents
      , optimizedEvents
      ]
  }
