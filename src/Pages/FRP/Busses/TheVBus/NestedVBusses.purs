module Pages.FRP.Busses.TheVBus.NestedVBusses where

import Prelude

import Contracts (Subsection, subsection)
import Deku.Control (text)
import Deku.Attribute ((:=))
import Deku.DOM as D

nestedVBusses :: Subsection
nestedVBusses = subsection
  { title: "Nested v-busses"
  , matter: pure
      [ D.p_
          [ text "This subsection will be about "
          , D.span [ D.Class := "font-bold" ] [ text "Nested v-busses" ]
          , text "."
          ]
      ]
  }
