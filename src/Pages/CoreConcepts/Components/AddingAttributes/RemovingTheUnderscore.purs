module Pages.CoreConcepts.Components.AddingAttributes.RemovingTheUnderscore where

import Prelude

import Components.Code (psCode)
import Components.ProTip (proTip)
import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.DOM as D

removingTheUnderscore :: Subsection
removingTheUnderscore = subsection
  { title: "Removing the underscore"
  , matter: pure
      [ D.p_
          [ text_
              "To add attributes to a Deku DOM element, remove the underscore(s) from the element. Let's start with the "
          , D.code_ [ text_ "span" ]
          , text_ "from the example above."
          , psCode "D.span__ \"I exist\""
          , text_
              "When we added the style attribute to make the color teal, we dropped the underscores. Furthermore, we added a "
          , D.code_ [ text_ "text" ]
          , text_ " to typeset the text."
          , psCode
              """D.span
  [ DA.style_ "color:teal;" ]
  [ text_ "I exist" ]"""
          ]
      , proTip
          { header: text_ "Expand the text"
          , message: D.div_
              [ text_
                  "When adding attributes to a double-underscored element like "
              , D.code_ [ text_ "D.span__" ]
              , text_ ", make sure to "
              , D.i_ [ text_ "also" ]
              , text_ " add an array with "
              , D.code_ [ text_ "text" ]
              , text_ " followed by your text inside of it. This is because "
              , D.code_ [ text_ "D.span__ \"foo\"" ]
              , text_ " is shorthand for "
              , D.code_ [ text_ "D.span_ [ text \"foo\" ]" ]
              , text_ "."
              ]
          }
      ]
  }
