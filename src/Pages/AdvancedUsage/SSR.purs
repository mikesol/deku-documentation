module Pages.AdvancedUsage.SSR where

import Prelude

import Contracts (Page, page)
import Deku.DOM.Attributes as DA
import Deku.Control (text_)
import Deku.DOM as D
import Pages.AdvancedUsage.SSR.HydratingAStaticSite (hydratingAStaticSite)
import Pages.AdvancedUsage.SSR.RenderingAStaticSite (renderingAStaticSite)
import Router.ADT (Route(..))

sSR :: Page
sSR = page
  { route: SSR
  , topmatter: pure
      [ D.p [DA.klass_ "lead"]
          [ text_ "Server-side rendering or Static site rendering? Choose two!"
          ]
      , D.p_
          [ text_
              "Deku has support for rendering any deku app as a static site. For games, this is not that helpful, but for documentation or landing pages this can make the loading experience snappier. This page goes over how to use Deku SSR."
          ]
      ]
  , sections:
      [ renderingAStaticSite
      , hydratingAStaticSite
      --, integrationWithVite 
      ]
  }
