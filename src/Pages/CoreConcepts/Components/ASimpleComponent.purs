module Pages.CoreConcepts.Components.ASimpleComponent where

import Prelude

import Components.Code (psCode)
import Components.ExampleBlockquote (exampleBlockquote)
import Contracts (Section, section)
import Deku.Control (text_)
import Deku.DOM as D
import Pages.CoreConcepts.Components.ASimpleComponent.AddingText (addingText)
import Pages.CoreConcepts.Components.ASimpleComponent.ArraysAllTheWayDown (arraysAllTheWayDown)
import Pages.CoreConcepts.Components.ASimpleComponent.WhatsInD (whatsInD)

aSimpleComponent :: forall lock payload. Section lock payload
aSimpleComponent = section
  { title: "A simple component"
  , topmatter: pure
      [ D.p_
          [ text_
              "Let's start by making a simple comonent. It will result in a few different DOM elements, and we'll build upon it throughout this page. Here's the code."
          ]
      , psCode
          """module Main where

import Prelude

import Deku.Control (text_)
import Deku.DOM as D
import Deku.Toplevel (runInBody)
import Effect (Effect)

main :: Effect Unit
main = runInBody
  ( D.div_
    [ D.span__ "I exist"
    , D.ul_ $ map D.li__ [ "A", "B", "C" ]
    , D.div_
        [ D.h3__ "foo"
        , D.i__ "bar"
        , text_ " "
        , D.b__ "baz"
        ]
    ]
  )"""
      , text_ "And here's the result."
      , exampleBlockquote
          [ D.div_
              [ D.span_ [ text_ "I exist" ]
              , D.ul_ $ map D.li__ [ "A", "B", "C" ]
              , D.div_
                  [ D.h3__ "foo"
                  , D.i__  "bar"
                  , text_ " "
                  , D.b__ "baz"
                  ]
              ]
          ]
      ]
  , subsections:
      [ whatsInD, arraysAllTheWayDown, addingText ]
  }
