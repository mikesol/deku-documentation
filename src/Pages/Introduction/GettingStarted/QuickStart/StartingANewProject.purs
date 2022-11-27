module Pages.Introduction.GettingStarted.QuickStart.StartingANewProject where

import Components.Code (jsCode)
import Components.ProTip (proTip)
import Contracts (Subsection, subsection)
import Deku.Attribute ((!:=))
import Deku.Control (text_)
import Deku.DOM as D

startingANewProject :: forall lock payload. Subsection lock payload
startingANewProject = subsection
  { title: "Starting a new project"
  , matter:
      [ D.p_
          [ text_
              "Sit commodi iste iure molestias qui amet voluptatem sed quaerat. Nostrum aut pariatur. Sint ipsa praesentium dolor error cumque velit tenetur quaerat exercitationem. Consequatur et cum atque mollitia qui quia necessitatibus."
          ]
      , jsCode
          """// cache-advance.config.js
export default {
  strategy: 'predictive',
  engine: {
    cpus: 12,
    backups: ['./storage/cache.wtf'],
  },
}"""
      , D.p_
          [ text_
              "Possimus saepe veritatis sint nobis et quam eos. Architecto consequatur odit perferendis fuga eveniet possimus rerum cumque. Ea deleniti voluptatum deserunt voluptatibus ut non iste. Provident nam asperiores vel laboriosam omnis ducimus enim nesciunt quaerat. Minus tempora cupiditate est quod."
          ]
      , proTip
          { header: text_ "You should know!"
          , message: D.p_
              [ text_
                  "This is what a disclaimer message looks like. You might want to include inline "
              , D.code_ [ text_ "code" ]
              , text_
                  " in it. Or maybe you’ll want to include a "
              , D.a (D.Href !:= "/")
                  [ text_ "link" ]
              , text_
                  " in it. I don’t think we should get too carried away with other scenarios like lists or tables — that would be silly."
              ]
          }
      ]
  }

