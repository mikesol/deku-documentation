module Pages.AdvancedUsage.AccessingTheDOM where

import Contracts (Page, page)
import Deku.Attribute ((!:=))
import Deku.Control (text_)
import Deku.DOM as D
import Pages.AdvancedUsage.AccessingTheDOM.TheSelfAttribute (theSelfAttribute)
import Pages.AdvancedUsage.AccessingTheDOM.ToplevelConsiderations (toplevelConsiderations)
import Router.ADT (Route(..))

accessingTheDOM :: forall lock payload. Page lock payload
accessingTheDOM = page
  { route: AccessingTheDOM
  , topmatter:
      [ D.p (D.Class !:= "lead")
          [ text_ "This page will be about "
          , D.span (D.Class !:= "font-bold") [ text_ "Custom elements" ]
          , text_ "."
          ]
      , D.p_
          [ text_
              "Possimus saepe veritatis sint nobis et quam eos. Architecto consequatur odit perferendis fuga eveniet possimus rerum cumque. Ea deleniti voluptatum deserunt voluptatibus ut non iste."
          ]
      ]
  , sections:
      [ theSelfAttribute, toplevelConsiderations ]
  }
