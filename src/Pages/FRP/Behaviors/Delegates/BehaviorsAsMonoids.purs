module Pages.FRP.Behaviors.OtherInstances.BehaviorsAsMonoids where

import Prelude

import Contracts (Subsection, subsection)
import Deku.DOM as D
import Deku.Pursx ((~~))
import Type.Proxy (Proxy(..))

behaviorsAsMonoids :: Subsection
behaviorsAsMonoids = subsection
  { title: "Behaviors as monoids"
  , matter: pure
      [ D.p_
          [ ( Proxy
                :: _
                     "<p><code>Behavior</code>s, can be <code>append</code>ed if the underlying type is a <code>Semigroup</code>, and <code>mempty</code> will generate a pure <code>Behavior</code> around <code>mempty</code> of the underlying <code>Monoid</code>.</p>"
            ) ~~ {}
          ]
      ]
  }
