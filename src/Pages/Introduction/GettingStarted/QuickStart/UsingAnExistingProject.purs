module Pages.Introduction.GettingStarted.QuickStart.UsingAnExistingProject where

import Prelude

import Components.Code (bashCode)
import Components.Disclaimer (disclaimer)
import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.DOM as D

usingAnExistingProject :: forall lock payload. Subsection lock payload
usingAnExistingProject = subsection
  { title: "Using an existing project"
  , matter: pure
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
      , disclaimer
          { header: text_ "Package sets"
          , message:
              D.div_
                [ text_
                    "PureScript uses package sets to make sure that a codebase has a coherent set of packages. This documentation works for Deku version "
                , D.code__ "0.9.8"
                , text_
                    " onwards, so if you'd like to use most of the conventions from this documentation, make sure to work with a package set that's made on or after December 9, 2022 (AD). You can update your package set by running "
                , D.code__ "spago upgrade-set"
                , text_ "."
                ]
          }
      ]
  }