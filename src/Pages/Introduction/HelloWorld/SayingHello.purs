module Pages.Introduction.HelloWorld.SayingHello where

import Contracts (Section, section)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D
import Pages.Introduction.HelloWorld.SayingHello.TheCode (theCode)
import Pages.Introduction.HelloWorld.SayingHello.TheResult (theResult)

sayingHello :: forall lock payload. Section lock payload
sayingHello = section
  { title: "Saying hello"
  , topmatter:
      [ D.p_
          [ text_ "This section will be about "
          , D.span (D.Class !:= "font-bold") [ text_ "Saying hello" ]
          , text_ "."
          ]
      ]
  , subsections:
      [ theCode, theResult ]
  }
