module Pages.Introduction.HelloWorld.TheAnatomyOfHello.FillingUpTheDOM where

import Prelude

import Components.Code (psCode)
import Contracts (Subsection, subsection)
import Deku.Control (text)
import Deku.DOM as D

fillingUpTheDOM :: Subsection
fillingUpTheDOM = subsection
  { title: "Filling up the DOM"
  , matter: pure
      [ psCode
          """text ("Hello world")"""
      , D.p_
          [ text "Last, and arguably least, we say "
          , D.code_ [ text "\"Hello world\"" ]
          , text ". To do so, we use the "
          , D.code_ [ text "text" ]
          , text
              " function which takes a string and turns it into an abstract representation of a text node. "
          , D.code_ [ text "runInBody" ]
          , text
              " interprets this instruction as something that should be rendered on a webpage."
          ]
      ]
  }
