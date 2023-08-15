module Pages.Introduction.HelloWorld.SayingHello.TheCode where

import Prelude

import Components.Code (psCodeNoCollapseWithLink)
import Contracts (Subsection, subsection)
import Deku.Control (text, text_)
import Deku.DOM as D
import Examples as Examples

theCode :: Subsection
theCode = subsection
  { title: "The code"
  , matter: pure
      [ D.p_
          [ text
              "Here it is, the moment you've all been waiting for. Let's say hello to the world!"
          ]
      , psCodeNoCollapseWithLink Examples.HelloWorldCode
      ]
  }
