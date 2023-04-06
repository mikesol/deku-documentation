module Pages.FRP.Busses.ASimpleBus where

import Prelude

import Contracts (Section, section)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D
import Pages.FRP.Busses.ASimpleBus.Uncurrying (uncurrying)
import Pages.FRP.Busses.ASimpleBus.PerformanceConsiderations (performanceConsiderations)
import Pages.FRP.Busses.ASimpleBus.BussesAsClosures (bussesAsClosures)
import Pages.FRP.Busses.ASimpleBus.BussesAndDekuHooks (bussesAndDekuHooks)

aSimpleBus :: Section
aSimpleBus = section
  { title: "A simple bus"
  , topmatter: pure
      [ D.p_
          [ text_ "This section will be about "
          , D.span (D.Class !:= "font-bold") [ text_ "A simple bus" ]
          , text_ "."
          ]
      ]
  , subsections:
      [ bussesAsClosures
      , uncurrying
      , performanceConsiderations
      , bussesAndDekuHooks
      ]
  }
