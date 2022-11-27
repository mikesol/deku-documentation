module Pages.FRP.Delegates.HeytingAlgebra where

import Contracts (Section, section)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D
import Pages.FRP.Delegates.HeytingAlgebra.BooleanLogicOnEvents (booleanLogicOnEvents)

heytingAlgebra :: forall lock payload. Section lock payload
heytingAlgebra = section
  { title: "HeytingAlgebra"
  , topmatter:
      [ D.p_
          [ text_ "This section will be about "
          , D.span (D.Class !:= "font-bold") [ text_ "HeytingAlgebra" ]
          , text_ "."
          ]
      ]
  , subsections:
      [ booleanLogicOnEvents ]
  }
