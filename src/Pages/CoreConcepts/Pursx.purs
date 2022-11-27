module Pages.CoreConcepts.Pursx where

import Prelude

import Contracts (Page, page)
import Deku.Attribute ((!:=))
import Deku.Control (text_)
import Deku.DOM as D
import Pages.CoreConcepts.Pursx.ASimpleExample (aSimpleExample)
import Pages.CoreConcepts.Pursx.DynamicAttributes (dynamicAttributes)
import Pages.CoreConcepts.Pursx.DynamicElements (dynamicElements)
import Router.ADT (Route(..))

pursx :: forall lock payload. Page lock payload
pursx = page
  { route: Pursx
  , topmatter: pure
      [ D.p (D.Class !:= "lead")
          [ text_ "This page will be about "
          , D.span (D.Class !:= "font-bold") [ text_ "Pursx" ]
          , text_ "."
          ]
      , D.p_
          [ text_
              "Possimus saepe veritatis sint nobis et quam eos. Architecto consequatur odit perferendis fuga eveniet possimus rerum cumque. Ea deleniti voluptatum deserunt voluptatibus ut non iste."
          ]
      ]
  , sections:
      [ aSimpleExample, dynamicAttributes, dynamicElements ]
  }
