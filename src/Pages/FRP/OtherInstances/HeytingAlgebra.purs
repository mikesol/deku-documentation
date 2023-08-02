module Pages.FRP.OtherInstances.HeytingAlgebra where

import Prelude

import Contracts (Section, section)
import Deku.Control (text)
import Deku.DOM as D
import Pages.FRP.OtherInstances.HeytingAlgebra.BooleanLogicOnEvents (booleanLogicOnEvents)

heytingAlgebra :: Section
heytingAlgebra = section
  { title: "Heyting algebra"
  , topmatter: pure
      [ D.p_
          [ D.code__ "Event"
          , text " also implements "
          , D.code__ "HeytigAlgebra"
          , text " for your truth-table needs."
          ]
      ]
  , subsections:
      [ booleanLogicOnEvents ]
  }
