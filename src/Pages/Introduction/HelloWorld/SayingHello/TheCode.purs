module Pages.Introduction.HelloWorld.SayingHello.TheCode where

import Prelude

import Components.Code (psCodeNoCollapseWithLink)
import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.DOM as D
import Examples as Examples

theCode :: forall lock payload. Subsection lock payload
theCode = subsection
  { title: "The code"
  , matter: pure
      [ D.p_
          [ text_
              "Here it is, what you've all been eagerly waiting for. Helloooo world!"
          ]
      , psCodeNoCollapseWithLink Examples.HelloWorldCode
      ]
  }
