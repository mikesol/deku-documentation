module Pages.FRP.Behaviors.OtherInstances.BehaviorsAsHeytingAlgebras where

import Prelude

import Contracts (Subsection, subsection)
import Deku.DOM as D
import Contracts (Subsection, subsection)
import Deku.DOM as D
import Deku.Pursx ((~~))
import Type.Proxy (Proxy(..))

behaviorsAsHeytingAlgebras :: Subsection
behaviorsAsHeytingAlgebras = subsection
  { title: "Behaviors as Heyting Algebras"
  , matter: pure
      [ ( Proxy
            :: _
                 "<p><code>Behavior</code>s, can act as a wrapper around arbitrary Heyting algebras so that you can <code>not</code>, <code>or</code>, and/or <code>and</code> them with reckless abandon.</p>"
        ) ~~ {}
      ]
  }
