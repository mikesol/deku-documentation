module Pages.FRP.Busses.TheVBus.PerformanceComparedToBus where

import Prelude

import Contracts (Subsection, subsection)
import Deku.Control (text)
import Deku.Attribute ((:=))
import Deku.DOM as D

performanceComparedToBus :: Subsection
performanceComparedToBus = subsection
  { title: "Performance compared to bus"
  , matter: pure
      [ D.p_
          [ text "This subsection will be about "
          , D.span [ D.Class := "font-bold" ]
              [ text "Performance compared to bus" ]
          , text "."
          ]
      ]
  }
