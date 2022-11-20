module Pages.CoreConcepts.Collections where

import Contracts (Page, page)
import Deku.Attribute ((!:=))
import Deku.Control (text_)
import Deku.DOM as D
import Pages.CoreConcepts.Collections.Monoids (monoids)
import Pages.CoreConcepts.Collections.DynamicElements (dynamicElements)
import Pages.CoreConcepts.Collections.FixedElements (fixedElements)

collections :: forall lock payload. Page lock payload
collections = page
  { title: "Collections"
  , topmatter:
          [ D.p (D.Class !:= "lead")
              [ text_ "This page will be about "
                , D.span (D.Class !:= "font-bold") [ text_ "Collections"]
                , text_ "."
              ]
          , D.p_
              [ text_
                  "Possimus saepe veritatis sint nobis et quam eos. Architecto consequatur odit perferendis fuga eveniet possimus rerum cumque. Ea deleniti voluptatum deserunt voluptatibus ut non iste."
              ]
          ]
  , sections:
      [ monoids,dynamicElements,fixedElements]
  }
