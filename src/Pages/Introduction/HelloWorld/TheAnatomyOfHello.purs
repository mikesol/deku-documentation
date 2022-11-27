module Pages.Introduction.HelloWorld.TheAnatomyOfHello where

import Contracts (Section, section)
import Deku.Control (text_)
import Deku.DOM as D
import Pages.Introduction.HelloWorld.TheAnatomyOfHello.FillingUpTheDOM (fillingUpTheDOM)
import Pages.Introduction.HelloWorld.TheAnatomyOfHello.Imports (imports)
import Pages.Introduction.HelloWorld.TheAnatomyOfHello.ModuleDeclaration (moduleDeclaration)
import Pages.Introduction.HelloWorld.TheAnatomyOfHello.RunningInTheBody (runningInTheBody)
import Pages.Introduction.HelloWorld.TheAnatomyOfHello.TheMainFunction (theMainFunction)

theAnatomyOfHello :: forall lock payload. Section lock payload
theAnatomyOfHello = section
  { title: "The anatomy of hello"
  , topmatter:
      [ D.p_
          [ text_ "There are a few things going on in our lil' "
          , D.i_ [ text_ "hello world" ]
          , text_
              " that we'll see over and over again. Soon, we'll start omitting some bits like import statements in the interest of saving space, so it's best we get acquainted with them now!"
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
