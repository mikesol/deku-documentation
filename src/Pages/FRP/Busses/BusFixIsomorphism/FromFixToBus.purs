module Pages.FRP.Busses.BusFixIsomorphism.FromFixToBus where

import Prelude

import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

fromFixToBus :: Subsection
fromFixToBus = subsection
  { title: "From fix to bus"
  , matter: pure
      [ D.p_
          [ text_ "This subsection will be about "
          , D.span [D.Class !:= "font-bold"] [ text_ "From fix to bus" ]
          , text_ "."
          ]
      ]
  }
