module Pages.AdvancedUsage.SSR.HydratingAStaticSite.Determinism where

import Prelude

import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

determinism :: forall lock payload. Subsection lock payload
determinism = subsection
  { title: "Determinism"
  , matter: pure
      [ D.p_
          [ text_ "This subsection will be about "
          , D.span (D.Class !:= "font-bold") [ text_ "Determinism" ]
          , text_ "."
          ]
      ]
  }
