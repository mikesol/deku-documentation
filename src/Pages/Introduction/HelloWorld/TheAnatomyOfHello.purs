module Pages.Introduction.HelloWorld.TheAnatomyOfHello where

import Contracts (Section, section)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D
import Pages.Introduction.HelloWorld.TheAnatomyOfHello.RunningInTheBody (runningInTheBody)
import Pages.Introduction.HelloWorld.TheAnatomyOfHello.Imports (imports)
import Pages.Introduction.HelloWorld.TheAnatomyOfHello.FillingUpTheDOM (fillingUpTheDOM)
import Pages.Introduction.HelloWorld.TheAnatomyOfHello.TheMainFunction (theMainFunction)

theAnatomyOfHello :: forall lock payload. Section lock payload
theAnatomyOfHello = section
  { title: "The anatomy of hello"
  , topmatter:
      [ D.p_
          [ text_ "This section will be about "
          , D.span (D.Class !:= "font-bold") [ text_ "The anatomy of hello" ]
          , text_ "."
          ]
      ]
  , subsections:
      [ imports, theMainFunction, runningInTheBody, fillingUpTheDOM ]
  }
