module Pages.FRP.Behaviors.OtherInstances where

import Contracts (Section, section)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D
import Pages.FRP.Behaviors.OtherInstances.BehaviorsAsMonoids (behaviorsAsMonoids)
import Pages.FRP.Behaviors.OtherInstances.BehaviorsAsRings (behaviorsAsRings)
import Pages.FRP.Behaviors.OtherInstances.BehaviorsAsHeytingAlgebras (behaviorsAsHeytingAlgebras)

otherInstances :: forall lock payload. Section lock payload
otherInstances = section
  { title: "Other instances"
  , topmatter:
      [ D.p_
          [ text_ "This section will be about "
          , D.span (D.Class !:= "font-bold") [ text_ "Other instances" ]
          , text_ "."
          ]
      ]
  , subsections:
      [ behaviorsAsMonoids, behaviorsAsHeytingAlgebras, behaviorsAsRings ]
  }
