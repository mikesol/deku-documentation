module Pages.Introduction.GettingStarted.QuickStart.UsingAnExistingProject where

import Components.Code (bashCode)
import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.DOM as D

usingAnExistingProject :: forall lock payload. Subsection lock payload
usingAnExistingProject = subsection
  { title: "Using an existing project"
  , matter:
      [ D.p_
          [ text_
              "If you have an existing project that does not yet have PureScript installed, you can install PureScript and related tooling with the following command."
          ]
      , bashCode "npm install -D purescript spago purs-tidy && npx spago init"
      , D.p_
          [ text_
              "Once PureScript is installed, or if you're working from a project with PureScript already installed, you can install Deku with the following command."
          ]
      , bashCode "npx spago install deku"
      ]
  }