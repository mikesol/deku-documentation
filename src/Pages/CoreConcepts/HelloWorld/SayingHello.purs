module Pages.CoreConcepts.HelloWorld.SayingHello where

import Contracts (Section, section)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D
import Pages.CoreConcepts.HelloWorld.SayingHello.TheCode (theCode)
import Pages.CoreConcepts.HelloWorld.SayingHello.TheResult (theResult)

sayingHello :: forall lock payload. Section lock payload
sayingHello = section
  { title: "SayingHello"
  , topmatter:
      [ D.p_
          [ text_ "This section will be about "
            , D.span (D.Class !:= "font-bold") [ text_ "SayingHello"]
            , text_ "."
          ]
      ]
  , subsections:
      [ theCode,theResult]
  }
