module Pages.FRP.Busses.BusFixIsomorphism.FromFixToBus where

import Prelude

import Contracts (Subsection, subsection)
import Deku.Control (text)
import Deku.Attribute ((:=))
import Deku.DOM as D

fromFixToBus :: Subsection
fromFixToBus = subsection
  { title: "From fix to bus"
  , matter: pure
      [ D.p_
          [ text "This subsection will be about "
          , D.span [ D.Class := "font-bold" ] [ text "From fix to bus" ]
          , text "."
          ]
      ]
  }
