module Pages.Introduction.HelloWorld.SayingHello.TheResult where

import Prelude


import Contracts (Subsection, subsection)
import Deku.Attributes (klass_)
import Deku.Control (text_)
import Deku.DOM as D

theResult :: forall lock payload. Subsection lock payload
theResult = subsection
  { title: "The result"
  , matter: pure
      [ D.p_
          [ text_ "And as promised, here's the result."
          , D.blockquote (klass_ "not-italic")
              [ D.span_ [ text_ "Hello world" ] ]
          , text_ "You gotta start somewhere!"
          ]
      ]
  }
