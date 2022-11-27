module Pages.CoreConcepts.Portals where

import Contracts (Page, page)
import Deku.Attribute ((!:=))
import Deku.Control (text_)
import Deku.DOM as D
import Pages.CoreConcepts.Portals.GlobalPortals (globalPortals)
import Pages.CoreConcepts.Portals.LocalPortals (localPortals)
import Router.ADT (Route(..))

portals :: forall lock payload. Page lock payload
portals = page
  { route: Portals
  , topmatter:
      [ D.p (D.Class !:= "lead")
          [ text_ "This page will be about "
          , D.span (D.Class !:= "font-bold") [ text_ "Portals" ]
          , text_ "."
          ]
      , D.p_
          [ text_
              "Possimus saepe veritatis sint nobis et quam eos. Architecto consequatur odit perferendis fuga eveniet possimus rerum cumque. Ea deleniti voluptatum deserunt voluptatibus ut non iste."
          ]
      ]
  , sections:
      [ globalPortals, localPortals ]
  }
