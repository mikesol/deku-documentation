module Pages.Introduction.HelloWorld.TheAnatomyOfHello.FillingUpTheDOM where

import Prelude

import Components.Code (psCode)
import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.DOM as D

fillingUpTheDOM :: Subsection
fillingUpTheDOM = subsection
  { title: "Filling up the DOM"
  , matter: pure
      [ psCode
          """text_ ("Hello world")"""
      , D.p_
          [ text_ "Last, and arguably least, we say "
          , D.code_ [ text_ "\"Hello world\"" ]
          , text_ ". To do so, we use the "
          , D.code_ [ text_ "text_" ]
          , text_
              " function which takes a string and turns it into an abstract representation of a text node. "
          , D.code_ [ text_ "runInBody" ]
          , text_
              " interprets this instruction as something that should be rendered on a webpage."
          ]
      ]
  }
