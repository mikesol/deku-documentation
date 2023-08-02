module Pages.FRP.Busses.ASimpleBus.Uncurrying where

import Prelude

import Contracts (Subsection, subsection)
import Deku.Control (text)
import Deku.Attribute ((:=))
import Deku.DOM as D

uncurrying :: Subsection
uncurrying = subsection
  { title: "Uncurrying"
  , matter: pure
      [ D.p_
          [ text "This subsection will be about "
          , D.span [ D.Class := "font-bold" ] [ text "Uncurrying" ]
          , text "."
          ]
      ]
  }
