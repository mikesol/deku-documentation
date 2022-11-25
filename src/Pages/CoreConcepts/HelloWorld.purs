module Pages.CoreConcepts.HelloWorld where

import Contracts (Page, page)
import Deku.Attribute ((!:=))
import Deku.Control (text_)
import Deku.DOM as D
import Pages.CoreConcepts.HelloWorld.SayingHello (sayingHello)
import Pages.CoreConcepts.HelloWorld.TheAnatomyOfHello (theAnatomyOfHello)
import Pages.CoreConcepts.HelloWorld.RunningOurProgram (runningOurProgram)

helloWorld :: forall lock payload. Page lock payload
helloWorld = page
  { title: "Hello world"
  , topmatter:
          [ D.p (D.Class !:= "lead")
              [ text_ "This page will be about "
                , D.span (D.Class !:= "font-bold") [ text_ "HelloWorld"]
                , text_ "."
              ]
          , D.p_
              [ text_
                  "Possimus saepe veritatis sint nobis et quam eos. Architecto consequatur odit perferendis fuga eveniet possimus rerum cumque. Ea deleniti voluptatum deserunt voluptatibus ut non iste."
              ]
          ]
  , sections:
      [ sayingHello,theAnatomyOfHello,runningOurProgram]
  }
