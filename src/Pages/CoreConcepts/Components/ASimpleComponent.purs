module Pages.CoreConcepts.Components.ASimpleComponent where

import Prelude

import Components.Code (psCodeWithLink)
import Components.ExampleBlockquote (exampleBlockquote)
import Components.TargetedLink (targetedLink)
import Contracts (Env(..), Section, section)
import Deku.Control (text_)
import Deku.DOM as D
import Examples as Examples
import Pages.CoreConcepts.Components.ASimpleComponent.AddingText (addingText)
import Pages.CoreConcepts.Components.ASimpleComponent.ArraysAllTheWayDown (arraysAllTheWayDown)
import Pages.CoreConcepts.Components.ASimpleComponent.WhatsInD (whatsInD)
import Router.ADT (Route(..))

aSimpleComponent :: forall lock payload. Section lock payload
aSimpleComponent = section
  { title: "A simple component"
  , topmatter: \(Env { routeLink }) ->
      [ D.p_
          [ text_
              "Let's start by making a simple comonent. It will result in a few different DOM elements, and we'll build upon it throughout this page. Here's the code."
          ]
      , psCodeWithLink Examples.ASimpleComponent
      , text_ "And here's the result."
      , exampleBlockquote
          [ D.div_
              [ D.span_ [ text_ "I exist" ]
              , D.ul_ $ map D.li__ [ "A", "B", "C" ]
              , D.div_
                  [ D.h3__ "foo"
                  , D.i__ "bar"
                  , text_ " "
                  , D.b__ "baz"
                  ]
              ]
          ]
      , D.p_
          [ text_
              "Before we proceed, it's important to establish a bit of Deku terminology that will come up often in this documentation."
          ]
      , D.ol_
          [ D.li_
              [ text_ "An "
              , D.b__ "element"
              , text_ " is a DOM element in the "
              , targetedLink
                  "https://developer.mozilla.org/en-US/docs/Web/API/Element"
                  [ text_ "MDN Documentation on Elements" ]
              , text_
                  " sense of the term. We will learn how to hook into the raw DOM in the "
              , routeLink AccessingTheDOM
              , text_ " section."
              ]
          , D.li_
              [ text_ "A "
              , D.b__ "component"
              , text_ " is a PureScript term with type "
              , D.code__ "forall lock payload. Document lock payload"
              , text_
                  ". Because that's tedious to write out, there's also an alias for this called  "
              , D.code__ "Nut"
              , text_ " defined in the module"
              , D.code__ "Deku.Core"
              , text_ " and named affectionately after "
              , targetedLink "https://zelda.fandom.com/wiki/Deku_Nut"
                  [ text_ "Deku nuts" ]
              , text_
                  ". "
              , D.code__ "Nut"
              , text_
                  " is the type produced by "
              , D.code__ "D.div_"
              , text_ ", "
              , D.code__ "D.span_"
              , text_
                  " and the other DOM-building instructions above. But the concept of a "
              , D.b__ "component"
              , text_
                  " is broader than a one-to-one relationship with DOM elements - it can also represent the absence of DOM elements (using "
              , D.code__ "blank"
              , text_
                  ", which we'll learn about later) or multiple DOM elements using "
              , D.code__ "dyn"
              , text_ " (which we'll also learn about later)."
              ]
          ]
      ]
  , subsections:
      [ whatsInD, arraysAllTheWayDown, addingText ]
  }
