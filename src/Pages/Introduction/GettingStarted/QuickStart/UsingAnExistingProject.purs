module Pages.Introduction.GettingStarted.QuickStart.UsingAnExistingProject where

import Prelude

import Components.Code (shSessionCode)
import Components.Disclaimer (disclaimer)
import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.DOM as D

usingAnExistingProject :: Subsection
usingAnExistingProject = subsection
  { title: "Using an existing project"
  , matter: pure
      [ D.p_
          [ text_
              "If you have an existing project that does not yet have PureScript installed, you can install PureScript and related tooling with the following command."
          ]
      , shSessionCode
          "$ npm install -D purescript spago@next purs-tidy && npx spago init"
      , D.p_
          [ text_
              "Once PureScript is installed, or if you're working from a project with PureScript already installed, you can install Deku with the following command."
          ]
      , shSessionCode "$ npx spago install deku"
      , disclaimer
          { header: text_ "Package sets"
          , message:
              D.div_
                [ text_
                    "PureScript uses package sets to make sure that a codebase has a coherent set of packages. This documentation works for Deku version "
                , D.code__ "0.12.0"
                , text_
                    " onwards, so if you'd like to use most of the conventions from this documentation, make sure to work with a package set that's made on or after August 6, 2024 (AD). We're partial to "
                , D.code__ "56.4.0"
                , text_ ". You can update your package set by running "
                , D.code__ "spago upgrade-set"
                , text_ "."
                ]
          }
      ]
  }
