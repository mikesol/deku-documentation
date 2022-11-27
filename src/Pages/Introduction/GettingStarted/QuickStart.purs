module Pages.Introduction.GettingStarted.QuickStart where

import Prelude

import Contracts (Section, section)
import Deku.Control (text_)
import Deku.DOM as D
import Pages.Introduction.GettingStarted.QuickStart.StartingANewProject (startingANewProject)
import Pages.Introduction.GettingStarted.QuickStart.UsingAnExistingProject (usingAnExistingProject)

quickStart :: forall lock payload. Section lock payload
quickStart = section
  { title: "Quick start"
  , topmatter: pure
      [ D.p_
          [ text_
              "Whether you're creating a greenfield project or integrating Deku into an existing application, we've got you covered!"
          ]
      ]
  , subsections:
      [ startingANewProject, usingAnExistingProject ]
  }
