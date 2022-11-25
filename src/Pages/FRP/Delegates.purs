module Pages.FRP.Delegates where

import Contracts (Page, page)
import Deku.Attribute ((!:=))
import Deku.Control (text_)
import Deku.DOM as D
import Pages.FRP.Delegates.HeytingAlgebra (heytingAlgebra)
import Pages.FRP.Delegates.Monoid (monoid)
import Pages.FRP.Delegates.Ring (ring)
import Router.ADT (Route(..))

delegates :: forall lock payload. Page lock payload
delegates = page
  { route: Delegates
  , topmatter:
          [ D.p (D.Class !:= "lead")
              [ text_ "This page will be about "
                , D.span (D.Class !:= "font-bold") [ text_ "Delegates"]
                , text_ "."
              ]
          , D.p_
              [ text_
                  "Possimus saepe veritatis sint nobis et quam eos. Architecto consequatur odit perferendis fuga eveniet possimus rerum cumque. Ea deleniti voluptatum deserunt voluptatibus ut non iste."
              ]
          ]
  , sections:
      [ ring,monoid,heytingAlgebra]
  }
