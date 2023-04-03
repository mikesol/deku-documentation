module Pages.FRP.Busses.ASimpleBus.BussesAsClosures where

import Prelude

import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

bussesAsClosures :: Subsection
bussesAsClosures = subsection
  { title: "Busses as closures"
  , matter: pure
      [ D.p_
          [ text_ "This subsection will be about "
          , D.span (D.Class !:= "font-bold") [ text_ "Busses as closures" ]
          , text_ "."
          ]
      ]
  }
