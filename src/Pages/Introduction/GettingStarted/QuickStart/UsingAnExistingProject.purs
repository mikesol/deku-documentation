module Pages.Introduction.GettingStarted.QuickStart.UsingAnExistingProject where

import Prelude

import Components.Code (shSessionCode)
import Components.Disclaimer (disclaimer)
import Contracts (Subsection, subsection)
import Deku.Control (text)
import Deku.DOM as D

usingAnExistingProject :: Subsection
usingAnExistingProject = subsection
  { title: "Using an existing project"
  , matter: pure
      [ D.p_
          [ text
              "If you have an existing project that does not yet have PureScript installed, you can install PureScript and related tooling with the following command."
          ]
      , shSessionCode
          "$ npm install -D purescript spago purs-tidy && npx spago init"
      , D.p_
          [ text
              "Once PureScript is installed, or if you're working from a project with PureScript already installed, you can install Deku with the following command."
          ]
      , shSessionCode "$ npx spago install deku"
      , disclaimer
          { header: text "Package sets"
          , message:
              D.div_
                [ text
                    "PureScript uses package sets to make sure that a codebase has a coherent set of packages. This documentation works for Deku version "
                , D.code__ "0.9.8"
                , text
                    " onwards, so if you'd like to use most of the conventions from this documentation, make sure to work with a package set that's made on or after December 9, 2022 (AD). You can update your package set by running "
                , D.code__ "spago upgrade-set"
                , text "."
                ]
          }
      ]
  }
