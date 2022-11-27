module Pages.CoreConcepts.Components.AddingAttributes.ASingleAttribute where

import Prelude

import Components.Code (psCode)
import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.DOM as D

aSingleAttribute :: forall lock payload. Subsection lock payload
aSingleAttribute = subsection
  { title: "A single attribute"
  , matter: pure
      [ D.p_
          [ text_ "Single attributes are specified with the "
          , D.code_ [ text_ "!:=" ]
          , text_ " infix operator."
          ]
      , psCode
          "D.Style !:= \"color:teal;\""
      ]
  }
