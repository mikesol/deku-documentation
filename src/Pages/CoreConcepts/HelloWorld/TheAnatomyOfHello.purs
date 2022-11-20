module Pages.CoreConcepts.HelloWorld.TheAnatomyOfHello where

import Contracts (Section, section)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D
import Pages.CoreConcepts.HelloWorld.TheAnatomyOfHello.RunningInTheBody (runningInTheBody)
import Pages.CoreConcepts.HelloWorld.TheAnatomyOfHello.Imports (imports)
import Pages.CoreConcepts.HelloWorld.TheAnatomyOfHello.FillingUpTheDOM (fillingUpTheDOM)
import Pages.CoreConcepts.HelloWorld.TheAnatomyOfHello.TheMainFunction (theMainFunction)

theAnatomyOfHello :: forall lock payload. Section lock payload
theAnatomyOfHello = section
  { title: "TheAnatomyOfHello"
  , topmatter:
      [ D.p_
          [ text_ "This section will be about "
            , D.span (D.Class !:= "font-bold") [ text_ "TheAnatomyOfHello"]
            , text_ "."
          ]
      ]
  , subsections:
      [ runningInTheBody,imports,fillingUpTheDOM,theMainFunction]
  }
