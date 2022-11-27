module Pages.Introduction.HelloWorld.TheAnatomyOfHello.ModuleDeclaration where

import Components.Code (psCode)
import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.DOM as D

moduleDeclaration :: forall lock payload. Subsection lock payload
moduleDeclaration = subsection
  { title: "Module declaration"
  , matter:
      [ psCode "module Main where"
      , D.p_
          [ text_ "All PureScript files "
          , D.i_ [ text_ "must" ]
          , text_
              " start with a module declaration, and it's customary to call this module "
          , D.code_ [ text_ "Main" ]
          , text_ " in a file called"
          , D.code_ [ text_ "Main.purs" ]
          , text_ "."
          ]
      ]
  }
