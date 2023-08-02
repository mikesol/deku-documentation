module Pages.AdvancedUsage.SSR.IntegrationWithVite.TheBuildStep where

import Prelude

import Contracts (Subsection, subsection)
import Deku.Control (text)
import Deku.Attribute ((:=))
import Deku.DOM as D

theBuildStep :: Subsection
theBuildStep = subsection
  { title: "The build step"
  , matter: pure
      [ D.p_
          [ text "This subsection will be about "
          , D.span [ D.Class := "font-bold" ] [ text "The build step" ]
          , text "."
          ]
      ]
  }
