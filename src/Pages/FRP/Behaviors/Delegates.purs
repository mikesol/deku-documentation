module Pages.FRP.Behaviors.Delegates where

import Contracts (Section, section)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D
import Pages.FRP.Behaviors.Delegates.BehaviorsAsMonoids (behaviorsAsMonoids)
import Pages.FRP.Behaviors.Delegates.BehaviorsAsRings (behaviorsAsRings)
import Pages.FRP.Behaviors.Delegates.BehaviorsAsHeytingAlgebras (behaviorsAsHeytingAlgebras)

delegates :: forall lock payload. Section lock payload
delegates = section
  { title: "Delegates"
  , topmatter:
      [ D.p_
          [ text_ "This section will be about "
            , D.span (D.Class !:= "font-bold") [ text_ "Delegates"]
            , text_ "."
          ]
      ]
  , subsections:
      [ behaviorsAsMonoids,behaviorsAsRings,behaviorsAsHeytingAlgebras]
  }
