module Pages.Introduction.HelloWorld.TheAnatomyOfHello.ModuleDeclaration where

import Prelude

import Components.Code (psCode)
import Contracts (Subsection, subsection)
import Deku.Control (text, text_)
import Deku.DOM as D

moduleDeclaration :: Subsection
moduleDeclaration = subsection
  { title: "Module declaration"
  , matter: pure
      [ psCode "module Main where"
      , D.p_
          [ text_ "All PureScript files "
          , D.i_ [ text_ "must" ]
          , text
              " start with a module declaration, and it's customary to call this module "
          , D.code_ [ text_ "Main" ]
          , text_ " in a file called "
          , D.code_ [ text_ "Main.purs" ]
          , text_ "."
          ]
      ]
  }
