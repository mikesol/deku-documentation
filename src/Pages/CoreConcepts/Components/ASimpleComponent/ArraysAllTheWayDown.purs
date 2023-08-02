module Pages.CoreConcepts.Components.ASimpleComponent.ArraysAllTheWayDown where

import Prelude

import Components.Code (psCode)
import Components.Disclaimer (disclaimer)
import Contracts (Subsection, subsection)
import Deku.Control (text)
import Deku.DOM as D

arraysAllTheWayDown :: Subsection
arraysAllTheWayDown = subsection
  { title: "Arrays all the way down"
  , matter: pure
      [ D.p_
          [ text
              "Let's revisit the previous example, but we'll expand it array-by-array to show how the Deku DOM is organized. The example starts with a single enclosing "
          , D.code_ [ text "div" ]
          , text " created by the instruction "
          , D.code_ [ text "D.div_" ]
          , text "."
          ]
      , psCode
          """main :: Effect Unit
main = runInBody
  ( D.div_
    [ ...
    ]
  )"""
      , D.p_
          [ text
              "The "
          , D.code_ [ text "div" ]
          , text " contains three elements, a "
          , D.code_ [ text "span" ]
          , text ", a "
          , D.code_ [ text "ul" ]
          , text ", and another "
          , D.code_ [ text "div" ]
          , text ". "
          ]
      , psCode
          """[ D.span_ [ ... ]
, D.ul_ $ map D.li__ [ ... ]
, D.div_
  [ ...
  ]
]"""
      , D.p_
          [ text
              "You can have as many nested elements as you want. Deku makes no effort to check that your DOM's sensible. While a "
          , D.code_ [ text "span" ]
          , text " in a "
          , D.code_ [ text "button" ]
          , text " in a "
          , D.code_ [ text "div" ]
          , text " makes sense, a "
          , D.code_ [ text "div" ]
          , text " in a "
          , D.code_ [ text "button" ]
          , text " in a "
          , D.code_ [ text "span" ]
          , text " does not. But we won't stop you from doing it! "
          ]
      , disclaimer
          { header: text "Malformed DOM"
          , message: D.p_
              [ text "Arrays all the way down means arrays "
              , D.i_ [ text "all the way down" ]
              , text
                  ", including elements that can't have children. For example, "
              , D.code_ [ text "<br />" ]
              , text
                  " can never take any children, and yet in Deku it is written "
              , D.code_ [ text "D.br_ []" ]
              , text ". This is done because there are rare cases where you "
              , D.i_ [ text "want" ]
              , text
                  " to emit a malformed DOM, like when teaching someone how not to write code. In general, though, make sure to leave arrays empty for elements like "
              , D.code_ [ text "<br />" ]
              , text " that don't take any elements."
              ]
          }
      , D.p_
          [ text "Lastly, we saw that the "
          , D.code_ [ text "ul" ]
          , text
              " is created from mapping over strings in order to create Deku "
          , D.code_ [ text "li" ]
          , text " components."
          ]
      , psCode """D.ul_ $ map D.li__ [ "A", "B", "C" ]"""
      , D.p_
          [ text
              "Deku is designed to allow you to use garden-variety functional programming patterns, like mapping over arrays, to build your DOM. In fact, that's how this documentation is built: all of the text you're reading is stored in structures that Deku marshalls into the DOM."
          ]
      ]
  }
