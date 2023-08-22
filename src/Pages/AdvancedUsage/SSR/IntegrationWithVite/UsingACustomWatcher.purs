module Pages.AdvancedUsage.SSR.IntegrationWithVite.UsingACustomWatcher where

import Prelude

import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.DOM.Attributes as DA
import Deku.DOM as D

usingACustomWatcher :: Subsection
usingACustomWatcher = subsection
  { title: "Using a custom watcher"
  , matter: pure
      [ D.p_
          [ text_ "This subsection will be about "
          , D.span [ DA.klass_ "font-bold" ]
              [ text_ "Using a custom watcher" ]
          , text_ "."
          ]
      ]
  }
