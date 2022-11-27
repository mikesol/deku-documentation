module Pages.AdvancedUsage.SSR.HydratingAStaticSite.TheHydrateFunction where

import Prelude


import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

theHydrateFunction :: forall lock payload. Subsection lock payload
theHydrateFunction = subsection
  { title: "The hydrate function"
  , matter: pure
      [ D.p_
          [ text_ "This subsection will be about "
          , D.span (D.Class !:= "font-bold") [ text_ "The hydrate function" ]
          , text_ "."
          ]
      ]
  }
