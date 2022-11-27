module Pages.Introduction.HelloWorld.RunningOurProgram.TheDevServer where

import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

theDevServer :: forall lock payload. Subsection lock payload
theDevServer = subsection
  { title: "The dev server"
  , matter:
      [ D.p_
          [ text_ "This subsection will be about "
          , D.span (D.Class !:= "font-bold") [ text_ "The dev server" ]
          , text_ "."
          ]
      ]
  }
