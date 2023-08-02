module Pages.FRP.Busses.ASimpleBus.BussesAndDekuHooks where

import Prelude

import Contracts (Subsection, subsection)
import Deku.Control (text)
import Deku.Attribute ((:=))
import Deku.DOM as D

bussesAndDekuHooks :: Subsection
bussesAndDekuHooks = subsection
  { title: "Busses and deku hooks"
  , matter: pure
      [ D.p_
          [ text "This subsection will be about "
          , D.span [ D.Class := "font-bold" ] [ text "Busses and deku hooks" ]
          , text "."
          ]
      ]
  }
