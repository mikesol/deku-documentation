module Pages.Introduction.HelloWorld.TheAnatomyOfHello where

import Prelude

import Contracts (Section, section)
import Deku.Control (text_)
import Deku.DOM as D
import Pages.Introduction.HelloWorld.TheAnatomyOfHello.FillingUpTheDOM (fillingUpTheDOM)
import Pages.Introduction.HelloWorld.TheAnatomyOfHello.Imports (imports)
import Pages.Introduction.HelloWorld.TheAnatomyOfHello.ModuleDeclaration (moduleDeclaration)
import Pages.Introduction.HelloWorld.TheAnatomyOfHello.RunningInTheBody (runningInTheBody)
import Pages.Introduction.HelloWorld.TheAnatomyOfHello.TheMainFunction (theMainFunction)

theAnatomyOfHello :: Section
theAnatomyOfHello = section
  { title: "The anatomy of hello"
  , topmatter: pure
      [ D.p_
          [ text_ "There are a few things going on in our "
          , D.b_ [ text_ "Hello world" ]
          , text_
              " that we'll see over and over again. Soon, we'll start collapsing some bits like import statements in the interest of saving space, so it's best we get acquainted with them now!"
          ]
      ]
  , subsections:
      [ moduleDeclaration
      , imports
      , theMainFunction
      , runningInTheBody
      , fillingUpTheDOM
      ]
  }
