module Pages.CoreConcepts.Components.AddingAttributes.SeveralAttributes where

import Prelude

import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

severalAttributes :: forall lock payload. Subsection lock payload
severalAttributes = subsection
  { title: "Several attributes"
  , matter: pure
      [ D.p_
          [ text_ "This subsection will be about "
          , D.span (D.Class !:= "font-bold") [ text_ "Several attributes" ]
          , text_ "."
          ]
      ]
  }
