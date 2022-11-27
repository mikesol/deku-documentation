module Pages.CoreConcepts.Collections.DynamicElements.TheUseDynHook where

import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

theUseDynHook :: forall lock payload. Subsection lock payload
theUseDynHook = subsection
  { title: "The useDyn hook"
  , matter:
      [ D.p_
          [ text_ "This subsection will be about "
          , D.span (D.Class !:= "font-bold") [ text_ "The useDyn hook" ]
          , text_ "."
          ]
      ]
  }
