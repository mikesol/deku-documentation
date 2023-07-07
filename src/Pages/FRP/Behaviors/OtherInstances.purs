module Pages.FRP.Behaviors.OtherInstances where

import Prelude

import Contracts (Section, section)
import Deku.DOM as D
import Deku.Pursx ((~~))
import Pages.FRP.Behaviors.OtherInstances.BehaviorsAsHeytingAlgebras (behaviorsAsHeytingAlgebras)
import Pages.FRP.Behaviors.OtherInstances.BehaviorsAsMonoids (behaviorsAsMonoids)
import Pages.FRP.Behaviors.OtherInstances.BehaviorsAsRings (behaviorsAsRings)
import Type.Proxy (Proxy(..))

otherInstances :: Section
otherInstances = section
  { title: "Other instances"
  , topmatter: pure
      [ ( Proxy
            :: _
                 "<p>Like <code>Event</code>s, <code>Behavior</code>s come supercharged with several instances that make working with them easier.</p>"
        ) ~~ {}

      ]
  , subsections:
      [ behaviorsAsMonoids, behaviorsAsHeytingAlgebras, behaviorsAsRings ]
  }
