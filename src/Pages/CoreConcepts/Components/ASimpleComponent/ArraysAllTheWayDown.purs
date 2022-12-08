module Pages.CoreConcepts.Components.ASimpleComponent.ArraysAllTheWayDown where

import Prelude

import Components.Code (psCode)
import Components.Disclaimer (disclaimer)
import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.DOM as D

arraysAllTheWayDown :: forall lock payload. Subsection lock payload
arraysAllTheWayDown = subsection
  { title: "Arrays all the way down"
  , matter: pure
      [ D.p_
          [ text_
              "Let's revisit the previous example, but we'll expand it array-by-array to show how the Deku DOM is organized. The example starts with a single enclosing "
          , D.code_ [ text_ "div" ]
          , text_ " created by the instruction "
          , D.code_ [ text_ "D.div_" ]
          , text_ "."
          ]
      , psCode
          """main :: Effect Unit
main = runInBody
  ( D.div_
    [ ...
    ]
  )"""
      , D.p_
          [ text_
              "The "
          , D.code_ [ text_ "div" ]
          , text_ " contains three elements, a "
          , D.code_ [ text_ "span" ]
          , text_ ", a "
          , D.code_ [ text_ "ul" ]
          , text_ ", and another "
          , D.code_ [ text_ "div" ]
          , text_ ". "
          ]
      , psCode
          """[ D.span_ [ ... ]
, D.ul_ $ map D.li__ [ ... ]
, D.div_
  [ ...
  ]
]"""
      , D.p_
          [ text_
              "You can have as many nested elements as you want. Deku makes no effort to check that your DOM's sensible. While a "
          , D.code_ [ text_ "span" ]
          , text_ " in a "
          , D.code_ [ text_ "button" ]
          , text_ " in a "
          , D.code_ [ text_ "div" ]
          , text_ " makes sense, a "
          , D.code_ [ text_ "div" ]
          , text_ " in a "
          , D.code_ [ text_ "button" ]
          , text_ " in a "
          , D.code_ [ text_ "span" ]
          , text_ " does not. But we won't stop you from doing it! "
          ]
      , disclaimer
          { header: text_ "Malformed DOM"
          , message: D.p_
              [ text_ "Arrays all the way down means arrays "
              , D.i_ [ text_ "all the way down" ]
              , text_
                  ", including elements that can't have children. For example, "
              , D.code_ [ text_ "<br />" ]
              , text_
                  " can never take any children, and yet in Deku it is written "
              , D.code_ [ text_ "D.br_ []" ]
              , text_ ". This is done because there are rare cases where you "
              , D.i_ [ text_ "want" ]
              , text_
                  " to emit a malformed DOM, like when teaching someone how not to write code. In general, though, make sure to leave arrays empty for elements like "
              , D.code_ [ text_ "<br />" ]
              , text_ " that don't take any elements."
              ]
          }
      , D.p_
          [ text_ "Lastly, we saw that the "
          , D.code_ [ text_ "ul" ]
          , text_
              " is created from mapping over strings in order to create Deku "
          , D.code_ [ text_ "li" ]
          , text_ " components."
          ]
      , psCode """D.ul_ $ map D.li__ [ "A", "B", "C" ]"""
      , D.p_
          [ text_
              "Deku is designed to allow you to use garden-variety functional programming patterns, like mapping over arrays, to build your DOM. In fact, that's how this documentation is built: all of the text you're reading is stored in structures that Deku marshalls into the DOM."
          ]
      ]
  }
