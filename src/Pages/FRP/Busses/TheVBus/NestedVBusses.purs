module Pages.FRP.Busses.TheVBus.NestedVBusses where

import Prelude


import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

nestedVBusses :: forall lock payload. Subsection lock payload
nestedVBusses = subsection
  { title: "Nested v-busses"
  , matter: pure
      [ D.p_
          [ text_ "This subsection will be about "
          , D.span (D.Class !:= "font-bold") [ text_ "Nested v-busses" ]
          , text_ "."
          ]
      ]
  }
