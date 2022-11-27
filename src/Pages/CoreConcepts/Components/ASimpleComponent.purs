module Pages.CoreConcepts.Components.ASimpleComponent where

import Prelude

import Prelude

import Components.Code (psCode)
import Contracts (Section, section)
import Deku.Attributes (klass_)
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


import Prelude

import Deku.Control (text_)
import Deku.DOM as D
import Deku.Toplevel (runInBody)
import Effect (Effect)

main :: Effect Unit
main = runInBody
  ( D.div_
    [ D.button_ [ text_ "I do nothing" ]
    , D.ul_ $ map (D.li_ <<< pure <<< text_) [ "A", "B", "C" ]
    , D.div_
        [ D.h3_ [ text_ "foo" ]
        , D.i_ [ text_ "bar" ]
        , text_ " "
        , D.b_ [ text_ "baz" ]
        ]
    ]
  )"""
      , text_ "And here's the result"
      , D.blockquote (klass_ "not-italic")
          [ D.div_
              [ D.button_ [ text_ "I do nothing" ]
              , D.ul_ $ map (D.li_ <<< pure <<< text_) [ "A", "B", "C" ]
              , D.div_
                  [ D.h3_ [ text_ "foo" ]
                  , D.i_ [ text_ "bar" ]
                  , text_ " "
                  , D.b_ [ text_ "baz" ]
                  ]
              ]
          ]
      ]
  , subsections:
      [ whatsInD, arraysAllTheWayDown, addingText ]
  }
