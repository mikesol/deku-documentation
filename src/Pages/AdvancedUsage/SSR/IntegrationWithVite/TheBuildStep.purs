module Pages.AdvancedUsage.SSR.IntegrationWithVite.TheBuildStep where

import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

theBuildStep :: forall lock payload. Subsection lock payload
theBuildStep = subsection
  { title: "The build step"
  , matter:
      [ D.p_
          [ text_ "This subsection will be about "
          , D.span (D.Class !:= "font-bold") [ text_ "The build step" ]
          , text_ "."
          ]
      ]
  }
