module Pages.CoreConcepts.MoreHooks.UseHot.PerformanceConsiderations where

import Prelude


import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

performanceConsiderations :: forall lock payload. Subsection lock payload
performanceConsiderations = subsection
  { title: "Performance considerations"
  , matter: pure
      [ D.p_
          [ text_ "This subsection will be about "
          , D.span (D.Class !:= "font-bold")
              [ text_ "Performance considerations" ]
          , text_ "."
          ]
      ]
  }
