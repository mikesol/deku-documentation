module Pages.Introduction.HelloWorld where

import Contracts (Page, page)
import Deku.Attribute ((!:=))
import Deku.Control (text_)
import Deku.DOM as D
import Pages.Introduction.HelloWorld.RunningOurProgram (runningOurProgram)
import Pages.Introduction.HelloWorld.SayingHello (sayingHello)
import Pages.Introduction.HelloWorld.TheAnatomyOfHello (theAnatomyOfHello)
import Router.ADT (Route(..))

helloWorld :: forall lock payload. Page lock payload
helloWorld = page
  { route: HelloWorld
  , topmatter:
      [ D.p (D.Class !:= "lead")
          [ text_ "This page will be about "
          , D.span (D.Class !:= "font-bold") [ text_ "HelloWorld" ]
          , text_ "."
          ]
      , D.p_
          [ text_
              "Possimus saepe veritatis sint nobis et quam eos. Architecto consequatur odit perferendis fuga eveniet possimus rerum cumque. Ea deleniti voluptatum deserunt voluptatibus ut non iste."
          ]
      ]
  , sections:
      [ sayingHello, theAnatomyOfHello, runningOurProgram ]
  }
