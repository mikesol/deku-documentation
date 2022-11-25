module Pages.Introduction.GettingStarted.QuickStart where

import Contracts (Section, section)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D
import Pages.Introduction.GettingStarted.QuickStart.StartingANewProject (startingANewProject)
import Pages.Introduction.GettingStarted.QuickStart.UsingAnExistingProject (usingAnExistingProject)

quickStart :: forall lock payload. Section lock payload
quickStart = section
  { title: "Quick start"
  , topmatter:
      [ D.p_
          [ text_ "This section will be about "
            , D.span (D.Class !:= "font-bold") [ text_ "Quick start"]
            , text_ "."
          ]
      ]
  , subsections:
      [ startingANewProject,usingAnExistingProject]
  }
