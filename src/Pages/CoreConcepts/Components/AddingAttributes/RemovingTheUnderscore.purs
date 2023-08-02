module Pages.CoreConcepts.Components.AddingAttributes.RemovingTheUnderscore where

import Prelude

import Components.Code (psCode)
import Components.ProTip (proTip)
import Contracts (Subsection, subsection)
import Deku.Control (text)
import Deku.DOM as D

removingTheUnderscore :: Subsection
removingTheUnderscore = subsection
  { title: "Removing the underscore"
  , matter: pure
      [ D.p_
          [ text
              "To add attributes to a Deku DOM element, remove the underscore(s) from the element. Let's start with the "
          , D.code_ [ text "span" ]
          , text "from the example above."
          , psCode "D.span__ \"I exist\""
          , text
              "When we added the style attribute to make the color teal, we dropped the underscores. Furthermore, we added a "
          , D.code_ [ text "text" ]
          , text " to typeset the text."
          , psCode
              """D.span
  [ D.Style := "color:teal;" ]
  [ text "I exist" ]"""
          ]
      , proTip
          { header: text "Expand the text"
          , message: D.div_
              [ text
                  "When adding attirubtes to a double-underscored element like "
              , D.code_ [ text "D.span__" ]
              , text ", make sure to "
              , D.i_ [ text "also" ]
              , text " add an array with "
              , D.code_ [ text "text" ]
              , text " followed by your text inside of it. This is because "
              , D.code_ [ text "D.span__ \"foo\"" ]
              , text " is shorthand for "
              , D.code_ [ text "D.span_ [ text \"foo\" ]" ]
              , text "."
              ]
          }
      ]
  }
