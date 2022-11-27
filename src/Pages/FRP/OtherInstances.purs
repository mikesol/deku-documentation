module Pages.FRP.OtherInstances where

import Prelude

import Contracts (Page, page)
import Deku.Attribute ((!:=))
import Deku.Control (text_)
import Deku.DOM as D
import Pages.FRP.OtherInstances.HeytingAlgebra (heytingAlgebra)
import Pages.FRP.OtherInstances.Monoid (monoid)
import Pages.FRP.OtherInstances.Ring (ring)
import Router.ADT (Route(..))

otherInstances :: forall lock payload. Page lock payload
otherInstances = page
  { route: OtherInstances
  , topmatter: pure
      [ D.p (D.Class !:= "lead")
          [ text_ "This page will be about "
          , D.span (D.Class !:= "font-bold") [ text_ "Other instances" ]
          , text_ "."
          ]
      , D.p_
          [ text_
              "Possimus saepe veritatis sint nobis et quam eos. Architecto consequatur odit perferendis fuga eveniet possimus rerum cumque. Ea deleniti voluptatum deserunt voluptatibus ut non iste."
          ]
      ]
  , sections:
      [ monoid, heytingAlgebra, ring ]
  }
