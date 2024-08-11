module Pages.AdvancedUsage.BuildingAndDeploying.SimpleApps where

import Prelude

import Components.Code (jsCode, psCodeNoCollapse)
import Contracts (Section, section)
import Deku.Control (text_)
import Deku.DOM as D
import Deku.DOM.Attributes as DA

simpleApps :: Section
simpleApps = section
  { title: "Single Page Apps"
  , topmatter: pure
      [ D.p_
          [ text_
              "Most PureScript apps export their main function as "
          , D.code__ "main"
          , text_ " from a file called "
          , D.code__ "Main.purs"
          , text_ ". This is then imported into an "
          , D.code__ "index.js"
          , text_ " file, which is the entry point for a single-page app (SPA)."
          ]
      , D.p_
          [ text_ "Deku is no different. Take the following "
          , D.code__ "Main.purs"
          , text_ "."
          ]
      , psCodeNoCollapse
          """module Main where

import Prelude
import Deku.Toplevel (runInBody)
import Effect (Effect)
import ExampleAssitant (ExampleSignature)
import Deku.Control (text_)
import Deku.Toplevel (runInBody)

main :: Effect Unit
main = void $ runInBody (text_ "I’m main!")
"""
      , D.p_
          [ text_ "You would then define your "
          , D.code__ "index.js"
          , text_ " thusly:"
          ]
      , jsCode
          """import { main } from "./output/Main/";
main();
"""
      , D.p_
          [ text_ "From here, you can use any old bundler, like "
          , D.a [ DA.href_ "https://vite.dev" ] [ D.code__ "vite" ]
          , text_ " or "
          , D.a [ DA.href_ "https://esbuild.github.io" ] [ D.code__ "esbuild" ]
          , text_
              " to bundle the index into a simple html file and deploy to your hosting service of choice."
          ]
      ]
  , subsections:
      []
  }
