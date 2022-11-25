module Pages.FRP.Applicatives where

import Contracts (Page, page)
import Deku.Attribute ((!:=))
import Deku.Control (text_)
import Deku.DOM as D
import Pages.FRP.Applicatives.Applicative (applicative)
import Pages.FRP.Applicatives.Functor (functor)
import Pages.FRP.Applicatives.MonadsAndFlattening (monadsAndFlattening)
import Router.ADT (Route(..))

applicatives :: forall lock payload. Page lock payload
applicatives = page
  { route: Applicatives
  , topmatter:
          [ D.p (D.Class !:= "lead")
              [ text_ "This page will be about "
                , D.span (D.Class !:= "font-bold") [ text_ "Applicatives"]
                , text_ "."
              ]
          , D.p_
              [ text_
                  "Possimus saepe veritatis sint nobis et quam eos. Architecto consequatur odit perferendis fuga eveniet possimus rerum cumque. Ea deleniti voluptatum deserunt voluptatibus ut non iste."
              ]
          ]
  , sections:
      [ applicative,monadsAndFlattening,functor]
  }
