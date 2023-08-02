module Pages.Introduction.HelloWorld.SayingHello.TheResult where

import Prelude

import Components.ExampleBlockquote (exampleBlockquote)
import Components.ProTip (proTip)
import Contracts (Subsection, subsection)
import Deku.Control (text)
import Deku.DOM as D

theResult :: Subsection
theResult = subsection
  { title: "The result"
  , matter: pure
      [ D.p_
          [ text "As promised, here's the result."
          , exampleBlockquote
              [ D.span_ [ text "Hello world" ] ]
          , text "You gotta start somewhere!"
          , proTip
              { header: text "Code snippets"
              , message: D.div_
                  [ text
                      "The code snippets in this documentation aren't just there to be purty. Dig in! You can open them on Gitpod, view them on Github, or run the command above the snippet (you can click on the clipboard to copy it) from the documentation project's root directory after having cloned it from Github via"
                  , D.code__
                      "git clone https://github.com/mikesol/deku-documentation"
                  , text ". After cloning, make sure to run "
                  , D.code__ "pnpm install"
                  , text " to get all the dependencies."
                  ]
              }
          ]
      ]
  }
