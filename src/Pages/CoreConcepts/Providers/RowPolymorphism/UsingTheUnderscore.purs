module Pages.CoreConcepts.Providers.RowPolymorphism.UsingTheUnderscore where

import Prelude

import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

usingTheUnderscore :: forall lock payload. Subsection lock payload
usingTheUnderscore = subsection
  { title: "Using the underscore"
  , matter: pure
      [ D.p_
          [ text_ "This subsection will be about "
          , D.span (D.Class !:= "font-bold") [ text_ "Using the underscore" ]
          , text_ "."
          ]
      ]
  }
