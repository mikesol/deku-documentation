module Pages.Introduction.HelloWorld.RunningOurProgram where

import Contracts (Section, section)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D
import Pages.Introduction.HelloWorld.RunningOurProgram.BundlingForProduction (bundlingForProduction)
import Pages.Introduction.HelloWorld.RunningOurProgram.TheDevServer (theDevServer)

runningOurProgram :: forall lock payload. Section lock payload
runningOurProgram = section
  { title: "Running our program"
  , topmatter:
      [ D.p_
          [ text_ "This section will be about "
          , D.span (D.Class !:= "font-bold") [ text_ "Running our program" ]
          , text_ "."
          ]
      ]
  , subsections:
      [ bundlingForProduction, theDevServer ]
  }
