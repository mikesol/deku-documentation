module Pages.FRP.Events.OptimizedEvents.OptimizedEventFunctions where

import Prelude

import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

optimizedEventFunctions :: forall lock payload. Subsection lock payload
optimizedEventFunctions = subsection
  { title: "Optimized event functions"
  , matter: pure
      [ D.p_
          [ text_ "This subsection will be about "
          , D.span (D.Class !:= "font-bold")
              [ text_ "Optimized event functions" ]
          , text_ "."
          ]
      ]
  }
