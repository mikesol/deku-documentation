module Pages.CoreConcepts.Components.ASimpleComponent where

import Prelude

import Components.Code (psCodeWithLink)
import Components.ExampleBlockquote (exampleBlockquote)
import Components.TargetedLink (targetedLink)
import Contracts (Env(..), Section, section)
import Deku.Control (text)
import Deku.DOM as D
import Examples as Examples
import Pages.CoreConcepts.Components.ASimpleComponent.AddingText (addingText)
import Pages.CoreConcepts.Components.ASimpleComponent.ArraysAllTheWayDown (arraysAllTheWayDown)
import Pages.CoreConcepts.Components.ASimpleComponent.WhatsInD (whatsInD)
import Router.ADT (Route(..))

aSimpleComponent :: Section
aSimpleComponent = section
  { title: "A simple component"
  , topmatter: \(Env { routeLink }) ->
      [ D.p_
          [ text
              "Let's start by making a simple comonent. It will result in a few different DOM elements being rendered, and we'll build upon it throughout this page. Here's the code."
          ]
      , psCodeWithLink Examples.ASimpleComponent
      , text "And here's the result."
      , exampleBlockquote
          [ D.div_
              [ D.span_ [ text "I exist" ]
              , D.ul_ $ map D.li__ [ "A", "B", "C" ]
              , D.div_
                  [ D.h3__ "foo"
                  , D.i__ "bar"
                  , text " "
                  , D.b__ "baz"
                  ]
              ]
          ]
      , D.p_
          [ text
              "Before we proceed, it's important to establish a bit of Deku terminology that will come in handy as you shred through this documentation."
          ]
      , D.ol_
          [ D.li_
              [ text "An "
              , D.b__ "element"
              , text " is a DOM element in the "
              , targetedLink
                  "https://developer.mozilla.org/en-US/docs/Web/API/Element"
                  [ text "MDN Documentation on Elements" ]
              , text
                  " sense of the term. We will learn how to hook into the raw DOM in the "
              , routeLink AccessingTheDOM
              , text " section."
              ]
          , D.li_
              [ text "A "
              , D.b__ "component"
              , text " is a PureScript term with type "
              , D.code__ "Nut"
              , text ", named affectionately after "
              , targetedLink "https://zelda.fandom.com/wiki/Deku_Nut"
                  [ text "Deku nuts" ]
              , text ". "
              , D.code__ "Nut"
              , text
                  " is the type produced by "
              , D.code__ "D.div_"
              , text ", "
              , D.code__ "D.span_"
              , text
                  " and the other DOM-building instructions above. But the concept of a "
              , D.b__ "component"
              , text
                  " is broader than a one-to-one relationship with DOM elements - it can also represent the absence of DOM elements using "
              , D.code__ "blank"
              , text
                  " (which we'll learn about later) or multiple DOM elements using "
              , D.code__ "dyn"
              , text " (which we'll also learn about later)."
              ]
          ]
      ]
  , subsections:
      [ whatsInD, arraysAllTheWayDown, addingText ]
  }
