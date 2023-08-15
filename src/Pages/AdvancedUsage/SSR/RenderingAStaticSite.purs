module Pages.AdvancedUsage.SSR.RenderingAStaticSite where

import Prelude

import Contracts (Section, section)
import Deku.Control (text, text_)
import Deku.DOM as D
import Pages.AdvancedUsage.SSR.RenderingAStaticSite.TheRunSSRFunction (theRunSSRFunction)
import Pages.AdvancedUsage.SSR.RenderingAStaticSite.TheToplevelElement (theToplevelElement)
import Pages.AdvancedUsage.SSR.RenderingAStaticSite.HowEffectsAreHandled (howEffectsAreHandled)

renderingAStaticSite :: Section
renderingAStaticSite = section
  { title: "Rendering a static site"
  , topmatter: pure
      [ D.p_
          [ text
              "Rendering a static site in Deku can be done using the same components you've seen all throughout this documentation. It only requires a different toplevel handler."
          ]
      ]
  , subsections:
      [ theRunSSRFunction, theToplevelElement, howEffectsAreHandled ]
  }
