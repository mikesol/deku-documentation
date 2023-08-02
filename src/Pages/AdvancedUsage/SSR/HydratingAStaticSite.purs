module Pages.AdvancedUsage.SSR.HydratingAStaticSite where

import Prelude

import Contracts (Section, section)
import Deku.Control (text)
import Deku.DOM as D
import Pages.AdvancedUsage.SSR.HydratingAStaticSite.TheHydrateFunction (theHydrateFunction)
import Pages.AdvancedUsage.SSR.HydratingAStaticSite.Determinism (determinism)

hydratingAStaticSite :: Section
hydratingAStaticSite = section
  { title: "Hydrating a static site"
  , topmatter: pure
      [ D.p_
          [ text
              "Unless your static site has no JavaScript, you'll likely want to hook it up to various event listeners. You can do that with the "
          , D.code__ "hydrate"
          , text " function."
          ]
      ]
  , subsections:
      [ theHydrateFunction, determinism ]
  }
