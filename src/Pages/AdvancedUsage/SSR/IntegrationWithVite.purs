module Pages.AdvancedUsage.SSR.IntegrationWithVite where

import Prelude

import Contracts (Section, section)
import Deku.Control (text_)
import Deku.DOM.Attributes as DA
import Deku.DOM as D
import Pages.AdvancedUsage.SSR.IntegrationWithVite.TheBuildStep (theBuildStep)
import Pages.AdvancedUsage.SSR.IntegrationWithVite.UsingACustomWatcher (usingACustomWatcher)

integrationWithVite :: Section
integrationWithVite = section
  { title: "IntegrationWithVite"
  , topmatter: pure
      [ D.p_
          [ text_ "This section will be about "
          , D.span [ DA.klass_ "font-bold" ] [ text_ "IntegrationWithVite" ]
          , text_ "."
          ]
      ]
  , subsections:
      [ theBuildStep, usingACustomWatcher ]
  }
