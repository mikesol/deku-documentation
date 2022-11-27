module Pages.AdvancedUsage.CustomElements where

import Contracts (Page, page)
import Deku.Attribute ((!:=))
import Deku.Control (text_)
import Deku.DOM as D
import Pages.AdvancedUsage.CustomElements.DefiningCustomElements (definingCustomElements)
import Pages.AdvancedUsage.CustomElements.UsingIonic (usingIonic)
import Router.ADT (Route(..))

customElements :: forall lock payload. Page lock payload
customElements = page
  { route: CustomElements
  , topmatter:
      [ D.p (D.Class !:= "lead")
          [ text_ "This page will be about "
          , D.span (D.Class !:= "font-bold") [ text_ "CustomElements" ]
          , text_ "."
          ]
      , D.p_
          [ text_
              "Possimus saepe veritatis sint nobis et quam eos. Architecto consequatur odit perferendis fuga eveniet possimus rerum cumque. Ea deleniti voluptatum deserunt voluptatibus ut non iste."
          ]
      ]
  , sections:
      [ usingIonic, definingCustomElements ]
  }
