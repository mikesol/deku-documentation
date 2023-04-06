module Pages.FRP.Busses.TheVBus where

import Prelude

import Contracts (Section, section)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D
import Pages.FRP.Busses.TheVBus.NestedVBusses (nestedVBusses)
import Pages.FRP.Busses.TheVBus.SettingUpAVBus (settingUpAVBus)
import Pages.FRP.Busses.TheVBus.PerformanceComparedToBus (performanceComparedToBus)

theVBus :: Section
theVBus = section
  { title: "The VBus"
  , topmatter: pure
      [ D.p_
          [ text_ "This section will be about "
          , D.span (D.Class !:= "font-bold") [ text_ "The VBus" ]
          , text_ "."
          ]
      ]
  , subsections:
      [ settingUpAVBus, nestedVBusses, performanceComparedToBus ]
  }
