module Pages.Introduction.HelloWorld.SayingHello where

import Contracts (Section, section)
import Deku.Control (text_)
import Deku.DOM as D
import Pages.Introduction.HelloWorld.SayingHello.TheCode (theCode)
import Pages.Introduction.HelloWorld.SayingHello.TheResult (theResult)

sayingHello :: forall lock payload. Section lock payload
sayingHello = section
  { title: "Saying hello"
  , topmatter:
      [ D.p_
          [ text_
              "This section, like many that will come after it, first present some "
          , D.i_ [ text_ "code" ]
          , text_ " and then present the "
          , D.i_ [ text_ "result" ]
          , text_
              " of the code rendered in a blockquote. In rare cases, we may present code without rendering or vice versa. But for the most part, we'll try to always pair up code with a working example."
          ]
      ]
  , subsections:
      [ theCode, theResult ]
  }
