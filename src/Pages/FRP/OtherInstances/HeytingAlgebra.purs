module Pages.FRP.OtherInstances.HeytingAlgebra where

import Prelude

import Contracts (Section, section)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D
import Pages.FRP.OtherInstances.HeytingAlgebra.BooleanLogicOnEvents (booleanLogicOnEvents)

heytingAlgebra :: Section
heytingAlgebra = section
  { title: "Heyting algebra"
  , topmatter: pure
      [ D.p_
          [ D.code__ "Event"
          , text_ " also implements "
          , D.code__ "HeytigAlgebra"
          , text_ " for your truth-table needs."
          ]
      ]
  , subsections:
      [ booleanLogicOnEvents ]
  }
