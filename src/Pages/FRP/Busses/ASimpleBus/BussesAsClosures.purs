module Pages.FRP.Busses.ASimpleBus.BussesAsClosures where

import Prelude

import Contracts (Subsection, subsection)
import Deku.Control (text)
import Deku.Attribute ((:=))
import Deku.DOM as D

bussesAsClosures :: Subsection
bussesAsClosures = subsection
  { title: "Busses as closures"
  , matter: pure
      [ D.p_
          [ text "This subsection will be about "
          , D.span [ D.Class := "font-bold" ] [ text "Busses as closures" ]
          , text "."
          ]
      ]
  }
