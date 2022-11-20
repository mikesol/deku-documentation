module Pages.FRP.Busses.TheVBus where

import Contracts (Section, section)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D
import Pages.FRP.Busses.TheVBus.NestedVBusses (nestedVBusses)
import Pages.FRP.Busses.TheVBus.SettingUpAVBus (settingUpAVBus)
import Pages.FRP.Busses.TheVBus.PerformanceComparedToBus (performanceComparedToBus)

theVBus :: forall lock payload. Section lock payload
theVBus = section
  { title: "TheVBus"
  , topmatter:
      [ D.p_
          [ text_ "This section will be about "
            , D.span (D.Class !:= "font-bold") [ text_ "TheVBus"]
            , text_ "."
          ]
      ]
  , subsections:
      [ nestedVBusses,settingUpAVBus,performanceComparedToBus]
  }
