module Pages.FRP.Busses.BusFixIsomorphism where

import Contracts (Section, section)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D
import Pages.FRP.Busses.BusFixIsomorphism.FromFixToBus (fromFixToBus)
import Pages.FRP.Busses.BusFixIsomorphism.FromBusToFix (fromBusToFix)

busFixIsomorphism :: forall lock payload. Section lock payload
busFixIsomorphism = section
  { title: "BusFixIsomorphism"
  , topmatter:
      [ D.p_
          [ text_ "This section will be about "
            , D.span (D.Class !:= "font-bold") [ text_ "BusFixIsomorphism"]
            , text_ "."
          ]
      ]
  , subsections:
      [ fromFixToBus,fromBusToFix]
  }
