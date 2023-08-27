module Pages.Introduction.HelloWorld where

import Prelude

import Contracts (Page, page)
import Deku.DOM.Attributes as DA
import Deku.Control (text_)
import Deku.DOM as D
import Pages.Introduction.HelloWorld.SayingHello (sayingHello)
import Pages.Introduction.HelloWorld.TheAnatomyOfHello (theAnatomyOfHello)
import Router.ADT (Route(..))

helloWorld :: Page
helloWorld = page
  { route: HelloWorld
  , topmatter: pure
      [ D.p [ DA.klass_ "lead" ]
          [ text_ "Let's teach Deku to say hello."
          ]
      , D.p_
          [ text_
              "Hello world in Deku is a one-liner... after imports, and type declarations, and newlines... But even with all of that stuff, it's a ten-liner. "
          , D.i__ "And oh what lines!"
          , text_ " Let's see them in action."
          ]
      ]
  , sections:
      [ sayingHello, theAnatomyOfHello ]
  }
