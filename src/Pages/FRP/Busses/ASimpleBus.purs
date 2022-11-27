module Pages.FRP.Busses.ASimpleBus where

import Contracts (Section, section)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D
import Pages.FRP.Busses.ASimpleBus.Uncurrying (uncurrying)
import Pages.FRP.Busses.ASimpleBus.PerformanceConsiderations (performanceConsiderations)
import Pages.FRP.Busses.ASimpleBus.BussesAsClosures (bussesAsClosures)
import Pages.FRP.Busses.ASimpleBus.BussesAndDekuHooks (bussesAndDekuHooks)

aSimpleBus :: forall lock payload. Section lock payload
aSimpleBus = section
  { title: "ASimpleBus"
  , topmatter:
      [ D.p_
          [ text_ "This section will be about "
          , D.span (D.Class !:= "font-bold") [ text_ "ASimpleBus" ]
          , text_ "."
          ]
      ]
  , subsections:
      [ uncurrying
      , performanceConsiderations
      , bussesAsClosures
      , bussesAndDekuHooks
      ]
  }
