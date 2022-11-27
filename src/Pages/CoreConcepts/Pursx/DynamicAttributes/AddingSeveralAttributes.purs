module Pages.CoreConcepts.Pursx.DynamicAttributes.AddingSeveralAttributes where

import Prelude

import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

addingSeveralAttributes :: forall lock payload. Subsection lock payload
addingSeveralAttributes = subsection
  { title: "Adding several attributes"
  , matter: pure
      [ D.p_
          [ text_ "This subsection will be about "
          , D.span (D.Class !:= "font-bold")
              [ text_ "Adding several attributes" ]
          , text_ "."
          ]
      ]
  }
