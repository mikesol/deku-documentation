module Pages.Introduction.HelloWorld.TheAnatomyOfHello.TheMainFunction where

import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

theMainFunction :: forall lock payload. Subsection lock payload
theMainFunction = subsection
  { title: "The main function"
  , matter:
      [ D.p_
          [ text_ "This subsection will be about "
          , D.span (D.Class !:= "font-bold") [ text_ "The main function" ]
          , text_ "."
          ]
      ]
  }
