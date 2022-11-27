module Pages.AdvancedUsage.SSR.RenderingAStaticSite where

import Contracts (Section, section)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D
import Pages.AdvancedUsage.SSR.RenderingAStaticSite.TheRunSSRFunction (theRunSSRFunction)
import Pages.AdvancedUsage.SSR.RenderingAStaticSite.TheToplevelElement (theToplevelElement)
import Pages.AdvancedUsage.SSR.RenderingAStaticSite.HowEffectsAreHandled (howEffectsAreHandled)

renderingAStaticSite :: forall lock payload. Section lock payload
renderingAStaticSite = section
  { title: "RenderingAStaticSite"
  , topmatter:
      [ D.p_
          [ text_ "This section will be about "
          , D.span (D.Class !:= "font-bold") [ text_ "RenderingAStaticSite" ]
          , text_ "."
          ]
      ]
  , subsections:
      [ theRunSSRFunction, theToplevelElement, howEffectsAreHandled ]
  }
