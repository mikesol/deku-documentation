module Pages.CoreConcepts.Components.AddingAttributes.UsefulShorthand where

import Prelude

import Components.Code (psCode)
import Contracts (Subsection, subsection)
import Deku.DOM.Attributes as DA
import Deku.Control (text_)
import Deku.DOM as D

usefulShorthand :: Subsection
usefulShorthand = subsection
  { title: "¿Sì? Yes Yes!"
  , matter: pure
      [ D.p_
          [ text_
              "PureScript has a delightful type-safe CSS library called "
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
