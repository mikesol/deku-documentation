module Pages.CoreConcepts.Collections.Monoids.ComponentsAsSemigroups where

import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

componentsAsSemigroups :: forall lock payload. Subsection lock payload
componentsAsSemigroups = subsection
  { title: "Components as semigroups"
  , matter:
      [ D.p_
          [ text_ "This subsection will be about "
          , D.span (D.Class !:= "font-bold")
              [ text_ "Components as semigroups" ]
          , text_ "."
          ]
      ]
  }
