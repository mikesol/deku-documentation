module Pages.FRP.Behaviors where

import Contracts (Page, page)
import Deku.Attribute ((!:=))
import Deku.Control (text_)
import Deku.DOM as D
import Pages.FRP.Behaviors.Applicative (applicative)
import Pages.FRP.Behaviors.Calculus (calculus)
import Pages.FRP.Behaviors.Definition (definition)
import Pages.FRP.Behaviors.Delegates (delegates)
import Router.ADT (Route(..))

behaviors :: forall lock payload. Page lock payload
behaviors = page
  { route: Behaviors
  , topmatter:
      [ D.p (D.Class !:= "lead")
          [ text_ "This page will be about "
          , D.span (D.Class !:= "font-bold") [ text_ "Behaviors" ]
          , text_ "."
          ]
      , D.p_
          [ text_
              "Possimus saepe veritatis sint nobis et quam eos. Architecto consequatur odit perferendis fuga eveniet possimus rerum cumque. Ea deleniti voluptatum deserunt voluptatibus ut non iste."
          ]
      ]
  , sections:
      [ definition, calculus, applicative, delegates ]
  }
