module Pages.CoreConcepts.Components.ASimpleComponent where

import Prelude

import Components.TargetedLink (targetedLink)
import Contracts (CollapseState(..), Env(..), Section, getEnv, getExample, section)
import Data.Maybe (Maybe(..))
import Deku.Control (text_)
import Deku.DOM as D
import Examples as Examples
import Pages.CoreConcepts.Components.ASimpleComponent.AddingText (addingText)
import Pages.CoreConcepts.Components.ASimpleComponent.ArraysAllTheWayDown (arraysAllTheWayDown)
import Pages.CoreConcepts.Components.ASimpleComponent.WhatsInD (whatsInD)
import Router.ADT (Route(..))

aSimpleComponent :: Section
aSimpleComponent = section
  { title: "A simple component"
  , topmatter: do
      Env { routeLink } <- getEnv
      example <- getExample StartExpanded Nothing Examples.ASimpleComponent
      pure
        [ D.p_
            [ text_
                "Let's start by making a simple comonent. It will result in a few different DOM elements being rendered, and we’ll build upon it throughout this page. Here's the code."
            ]
        , example
        , D.p_
            [ text_
                "Before we proceed, it's important to establish a bit of Deku terminology that will come in handy as you shred through this documentation."
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
                , D.code__ "Nut"
                , text_ ", named affectionately after "
                , targetedLink "https://zelda.fandom.com/wiki/Deku_Nut"
                    [ text_ "Deku nuts" ]
                , text_ ". "
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
                    " is broader than a one-to-one relationship with DOM elements - it can also represent the absence of DOM elements using "
                , D.code__ "mempty"
                , text_
                    " (which we’ll learn about later) or multiple DOM elements using "
                , D.code__ "useDyn"
                , text_ " (which we’ll also learn about later)."
                ]
            ]
        ]
  , subsections:
      [ whatsInD, arraysAllTheWayDown, addingText ]
  }
