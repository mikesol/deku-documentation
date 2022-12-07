module Pages.AdvancedUsage.SSR.HydratingAStaticSite where

import Prelude

import Contracts (Section, section)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D
import Pages.AdvancedUsage.SSR.HydratingAStaticSite.TheHydrateFunction (theHydrateFunction)
import Pages.AdvancedUsage.SSR.HydratingAStaticSite.Determinism (determinism)

hydratingAStaticSite :: forall lock payload. Section lock payload
hydratingAStaticSite = section
  { title: "Hydrating a static site"
  , topmatter: pure
      [ D.p_
          [ text_
              "Unless your static site has no JavaScript, you'll likely want to hook it up to various event listeners. You can do that with the "
          , D.code__ "hydrate"
          , text_ " function."
          ]
      ]
  , subsections:
      [ theHydrateFunction, determinism ]
  }
