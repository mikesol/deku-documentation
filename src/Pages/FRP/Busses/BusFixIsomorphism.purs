module Pages.FRP.Busses.BusFixIsomorphism where

import Prelude

import Contracts (Section, section)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D
import Pages.FRP.Busses.BusFixIsomorphism.FromFixToBus (fromFixToBus)
import Pages.FRP.Busses.BusFixIsomorphism.FromBusToFix (fromBusToFix)

busFixIsomorphism :: Section
busFixIsomorphism = section
  { title: "Bus-fix isomorphism"
  , topmatter: pure
      [ D.p_
          [ text_ "This section will be about "
          , D.span [D.Class !:= "font-bold"] [ text_ "Bus-fix isomorphism" ]
          , text_ "."
          ]
      ]
  , subsections:
      [ fromFixToBus, fromBusToFix ]
  }
