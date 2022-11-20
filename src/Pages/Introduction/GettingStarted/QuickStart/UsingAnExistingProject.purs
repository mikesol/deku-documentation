module Pages.Introduction.GettingStarted.QuickStart.UsingAnExistingProject where

import Components.Disclaimer (disclaimer)
import Contracts (Subsection, subsection)
import Deku.Attribute ((!:=))
import Deku.Control (text_)
import Deku.DOM as D

usingAnExistingProject :: forall lock payload. Subsection lock payload
usingAnExistingProject = subsection
  { title: "Using an existing project"
  , matter:
      [ D.p_
          [ text_
              "Sit commodi iste iure molestias qui amet voluptatem sed quaerat. Nostrum aut pariatur. Sint ipsa praesentium dolor error cumque velit tenetur quaerat exercitationem. Consequatur et cum atque mollitia qui quia necessitatibus."
          ]
      , D.pre (D.Class !:= "prism-code language-shell")
          [ D.code_
              [ D.span (D.Class !:= "token function")
                  [ text_ "npm" ]
              , D.span (D.Class !:= "token plain") []
              , D.span (D.Class !:= "token function")
                  [ text_ "install" ]
              , D.span (D.Class !:= "token plain")
                  [ text_ " @tailwindlabs/cache-advance" ]
              ]
          ]
      , D.p_
          [ text_
              "Possimus saepe veritatis sint nobis et quam eos. Architecto consequatur odit perferendis fuga eveniet possimus rerum cumque. Ea deleniti voluptatum deserunt voluptatibus ut non iste. Provident nam asperiores vel laboriosam omnis ducimus enim nesciunt quaerat. Minus tempora cupiditate est quod."
          ]
      , disclaimer
          { header: text_ "Oh no! Something bad happened!"
          , message: D.p_
              [ text_
                  "This is what a disclaimer message looks like. You might want to include inline "
              , D.code_ [ text_ "code" ]
              , text_
                  " in it. Or maybe you’ll want to include a "
              , D.a (D.Href !:= "/") [ text_ "link" ]
              , text_
                  " in it. I don’t think we should get too carried away with other scenarios like lists or tables — that would be silly."
              ]
          }
      ]
  }