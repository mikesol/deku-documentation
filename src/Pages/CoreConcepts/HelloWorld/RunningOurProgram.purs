module Pages.CoreConcepts.HelloWorld.RunningOurProgram where

import Contracts (Section, section)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D
import Pages.CoreConcepts.HelloWorld.RunningOurProgram.BundlingForProduction (bundlingForProduction)
import Pages.CoreConcepts.HelloWorld.RunningOurProgram.TheDevServer (theDevServer)

runningOurProgram :: forall lock payload. Section lock payload
runningOurProgram = section
  { title: "RunningOurProgram"
  , topmatter:
      [ D.p_
          [ text_ "This section will be about "
            , D.span (D.Class !:= "font-bold") [ text_ "RunningOurProgram"]
            , text_ "."
          ]
      ]
  , subsections:
      [ bundlingForProduction,theDevServer]
  }
