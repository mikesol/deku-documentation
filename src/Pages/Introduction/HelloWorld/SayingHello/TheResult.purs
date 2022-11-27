module Pages.Introduction.HelloWorld.SayingHello.TheResult where

import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

theResult :: forall lock payload. Subsection lock payload
theResult = subsection
  { title: "The result"
  , matter:
      [ D.p_
          [ text_ "This subsection will be about "
          , D.span (D.Class !:= "font-bold") [ text_ "The result" ]
          , text_ "."
          ]
      ]
  }
