module Pages.CoreConcepts.Components where

import Contracts (Page, page)
import Deku.Attribute ((!:=))
import Deku.Control (text_)
import Deku.DOM as D
import Pages.CoreConcepts.Components.ASimpleComponent (aSimpleComponent)
import Pages.CoreConcepts.Components.AddingAttributes (addingAttributes)
import Pages.CoreConcepts.Components.AddingEventHandlers (addingEventHandlers)
import Router.ADT (Route(..))

components :: forall lock payload. Page lock payload
components = page
  { route: Components
  , topmatter:
      [ D.p (D.Class !:= "lead")
          [ text_ "This page will be about "
          , D.span (D.Class !:= "font-bold") [ text_ "Components" ]
          , text_ "."
          ]
      , D.p_
          [ text_
              "Possimus saepe veritatis sint nobis et quam eos. Architecto consequatur odit perferendis fuga eveniet possimus rerum cumque. Ea deleniti voluptatum deserunt voluptatibus ut non iste."
          ]
      ]
  , sections:
      [ aSimpleComponent, addingAttributes, addingEventHandlers ]
  }
