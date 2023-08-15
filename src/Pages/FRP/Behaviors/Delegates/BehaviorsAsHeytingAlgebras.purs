module Pages.FRP.Polls.OtherInstances.PollsAsHeytingAlgebras where

import Prelude

import Contracts (Subsection, subsection)
import Deku.DOM as D
import Contracts (Subsection, subsection)
import Deku.DOM as D
import Deku.Pursx ((~~))
import Type.Proxy (Proxy(..))

pollsAsHeytingAlgebras :: Subsection
pollsAsHeytingAlgebras = subsection
  { title: "Polls as Heyting Algebras"
  , matter: pure
      [ ( Proxy
            :: _
                 "<p><code>Poll</code>s, can act as a wrapper around arbitrary Heyting algebras so that you can <code>not</code>, <code>or</code>, and/or <code>and</code> them with reckless abandon.</p>"
        ) ~~ {}
      ]
  }
