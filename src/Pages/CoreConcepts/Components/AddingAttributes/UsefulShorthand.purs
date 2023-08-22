module Pages.CoreConcepts.Components.AddingAttributes.UsefulShorthand where

import Prelude

import Components.Code (psCode)
import Components.Table (tableClass)
import Contracts (Subsection, subsection)
import Deku.DOM.Attributes as DA
import Deku.Control (text_)
import Deku.DOM as D

usefulShorthand :: Subsection
usefulShorthand = subsection
  { title: "Useful shorthand"
  , matter: pure
      [ D.p_
          [ text_
              "An ever-expanding library of shorthand functions is present in Deku to help you succinctly articulate various attributes and combinations of attributes. Here is what's currently available."
          ]
      , D.table [ tableClass ]
          [ D.tr_
              [ D.th [ tableClass ] [ text_ "Shorthand" ]
              , D.th [ tableClass ] [ text_ "Longer version" ]
              ]
          , D.tr_
              [ D.td [ tableClass ] [ D.code_ [ text_ "klass \"foo\"" ] ]
              , D.td [ tableClass ] [ D.code_ [ text_ "D.Class := \"foo\"" ] ]
              ]
          , D.tr_
              [ D.td [ tableClass ] [ D.code_ [ text_ "id_ \"foo\"" ] ]
              , D.td [ tableClass ] [ D.code_ [ text_ "D.Id := \"foo\"" ] ]
              ]
          , D.tr_
              [ D.td [ tableClass ]
                  [ D.code_ [ text_ "style_ \"color:black;\"" ] ]
              , D.td [ tableClass ]
                  [ D.code_ [ text_ "D.Style := \"color:black;\"" ] ]
              ]
          ]
      , D.p_
          [ text_
              "Additionally, PureScript has a delightful type-safe CSS library called "
          , D.a
              [ DA.href_
                  "https://pursuit.purescript.org/packages/purescript-css/"
              , DA.target_ "_blank"
              ]
              [ D.code_ [ text_ "purescript-css" ] ]
          , text_
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
