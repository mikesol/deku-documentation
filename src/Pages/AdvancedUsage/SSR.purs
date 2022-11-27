module Pages.AdvancedUsage.SSR where

import Contracts (Page, page)
import Deku.Attribute ((!:=))
import Deku.Control (text_)
import Deku.DOM as D
import Pages.AdvancedUsage.SSR.HydratingAStaticSite (hydratingAStaticSite)
import Pages.AdvancedUsage.SSR.IntegrationWithVite (integrationWithVite)
import Pages.AdvancedUsage.SSR.RenderingAStaticSite (renderingAStaticSite)
import Router.ADT (Route(..))

sSR :: forall lock payload. Page lock payload
sSR = page
  { route: SSR
  , topmatter:
      [ D.p (D.Class !:= "lead")
          [ text_ "This page will be about "
          , D.span (D.Class !:= "font-bold") [ text_ "SSR" ]
          , text_ "."
          ]
      , D.p_
          [ text_
              "Possimus saepe veritatis sint nobis et quam eos. Architecto consequatur odit perferendis fuga eveniet possimus rerum cumque. Ea deleniti voluptatum deserunt voluptatibus ut non iste."
          ]
      ]
  , sections:
      [ renderingAStaticSite
      , hydratingAStaticSite
      --, integrationWithVite 
      ]
  }
