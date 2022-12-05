module Pages.FRP.OtherInstances.HeytingAlgebra where

import Prelude

import Contracts (Section, section)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D
import Pages.FRP.OtherInstances.HeytingAlgebra.BooleanLogicOnEvents (booleanLogicOnEvents)

heytingAlgebra :: forall lock payload. Section lock payload
heytingAlgebra = section
  { title: "Heyting algebra"
  , topmatter: pure
      [ D.p_
          [ text_ "This section will be about "
          , D.span (D.Class !:= "font-bold") [ text_ "HeytingAlgebra" ]
          , text_ "."
          ]
      ]
  , subsections:
      [ booleanLogicOnEvents ]
  }
