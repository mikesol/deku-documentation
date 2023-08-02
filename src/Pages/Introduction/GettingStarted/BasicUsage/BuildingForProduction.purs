module Pages.Introduction.GettingStarted.BasicUsage.BuildingForProduction where

import Prelude

import Components.ProTip (proTip)
import Contracts (Subsection, subsection)
import Deku.Attribute ((:=))
import Deku.Control (text)
import Deku.DOM as D

buildingForProduction :: Subsection
buildingForProduction = subsection
  { title: "Building for production"
  , matter: pure
      [ D.p_
          [ text
              "Sit commodi iste iure molestias qui amet voluptatem sed quaerat. Nostrum aut pariatur. Sint ipsa praesentium dolor error cumque velit tenetur quaerat exercitationem. Consequatur et cum atque mollitia qui quia necessitatibus."
          ]
      , D.pre [D.Class := "prism-code language-shell"]
          [ D.code_
              [ text
                  """import { foo } from "bar";
const x = foo;
"""
              ]
          ]
      , D.p_
          [ text
              "Possimus saepe veritatis sint nobis et quam eos. Architecto consequatur odit perferendis fuga eveniet possimus rerum cumque. Ea deleniti voluptatum deserunt voluptatibus ut non iste. Provident nam asperiores vel laboriosam omnis ducimus enim nesciunt quaerat. Minus tempora cupiditate est quod."
          ]
      , proTip
          { header: text "Oh no! Something bad happened!"
          , message: D.p_
              [ text
                  "This is what a disclaimer message looks like. You might want to include inline "
              , D.code_ [ text "code" ]
              , text
                  " in it. Or maybe you’ll want to include a "
              , D.a [D.Href := "/"] [ text "link" ]
              , text
                  " in it. I don’t think we should get too carried away with other scenarios like lists or tables — that would be silly."
              ]
          }
      ]
  }