module Pages.FRP.Busses.BusFixIsomorphism.FromBusToFix where

import Prelude

import Contracts (Subsection, subsection)
import Deku.Control (text)
import Deku.Attribute ((:=))
import Deku.DOM as D

fromBusToFix :: Subsection
fromBusToFix = subsection
  { title: "From bus to fix"
  , matter: pure
      [ D.p_
          [ text "This subsection will be about "
          , D.span [ D.Class := "font-bold" ] [ text "From bus to fix" ]
          , text "."
          ]
      ]
  }
