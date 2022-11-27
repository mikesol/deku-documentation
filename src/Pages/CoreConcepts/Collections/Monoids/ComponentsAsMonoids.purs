module Pages.CoreConcepts.Collections.Monoids.ComponentsAsMonoids where

import Prelude

import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

componentsAsMonoids :: forall lock payload. Subsection lock payload
componentsAsMonoids = subsection
  { title: "Components as monoids"
  , matter: pure
      [ D.p_
          [ text_ "This subsection will be about "
          , D.span (D.Class !:= "font-bold") [ text_ "Components as monoids" ]
          , text_ "."
          ]
      ]
  }
