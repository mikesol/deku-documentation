module Pages.CoreConcepts.Components.AddingAttributes.UsefulShorthand where

import Prelude

import Components.Code (psCode)
import Components.Table (tableClass)
import Contracts (Subsection, subsection)
import Deku.Attribute ((:=))
import Deku.Control (text)
import Deku.DOM as D

usefulShorthand :: Subsection
usefulShorthand = subsection
  { title: "Useful shorthand"
  , matter: pure
      [ D.p_
          [ text
              "An ever-expanding library of shorthand functions is present in Deku to help you succinctly articulate various attributes and combinations of attributes. Here is what's currently available."
          ]
      , D.table [ tableClass ]
          [ D.tr_
              [ D.th [ tableClass ] [ text "Shorthand" ]
              , D.th [ tableClass ] [ text "Longer version" ]
              ]
          , D.tr_
              [ D.td [ tableClass ] [ D.code_ [ text "klass \"foo\"" ] ]
              , D.td [ tableClass ] [ D.code_ [ text "D.Class := \"foo\"" ] ]
              ]
          , D.tr_
              [ D.td [ tableClass ] [ D.code_ [ text "id_ \"foo\"" ] ]
              , D.td [ tableClass ] [ D.code_ [ text "D.Id := \"foo\"" ] ]
              ]
          , D.tr_
              [ D.td [ tableClass ]
                  [ D.code_ [ text "style_ \"color:black;\"" ] ]
              , D.td [ tableClass ]
                  [ D.code_ [ text "D.Style := \"color:black;\"" ] ]
              ]
          ]
      , D.p_
          [ text
              "Additionally, PureScript has a delightful type-safe CSS library called "
          , D.a
              [ D.Href :=
                  "https://pursuit.purescript.org/packages/purescript-css/"
              , D.Target := "_blank"
              ]
              [ D.code_ [ text "purescript-css" ] ]
          , text
              " that you can use to author CSS, which is easier to debug than string-based styles."
          ]
      , psCode
          """import Deku.CSS as CSS
import CSS (color, red, display, block)

myStyleString = CSS.render do
  color red
  display block
"""
      ]
  }
