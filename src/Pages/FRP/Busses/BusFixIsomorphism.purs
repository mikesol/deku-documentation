module Pages.FRP.Busses.BusFixIsomorphism where

import Prelude

import Contracts (Section, section)
import Deku.Control (text)
import Deku.Attribute ((:=))
import Deku.DOM as D
import Pages.FRP.Busses.BusFixIsomorphism.FromFixToBus (fromFixToBus)
import Pages.FRP.Busses.BusFixIsomorphism.FromBusToFix (fromBusToFix)

busFixIsomorphism :: Section
busFixIsomorphism = section
  { title: "Bus-fix isomorphism"
  , topmatter: pure
      [ D.p_
          [ text "This section will be about "
          , D.span [ D.Class := "font-bold" ] [ text "Bus-fix isomorphism" ]
          , text "."
          ]
      ]
  , subsections:
      [ fromFixToBus, fromBusToFix ]
  }
