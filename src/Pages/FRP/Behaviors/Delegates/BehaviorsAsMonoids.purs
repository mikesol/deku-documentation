module Pages.FRP.Polls.OtherInstances.PollsAsMonoids where

import Prelude

import Contracts (Subsection, subsection)
import Deku.DOM as D
import Deku.Pursx (pursx)

pollsAsMonoids :: Subsection
pollsAsMonoids = subsection
  { title: "Polls as monoids"
  , matter: pure
      [ D.p_
          [ pursx
              @"<p><code>Poll</code>s, can be <code>append</code>ed if the underlying type is a <code>Semigroup</code>, and <code>mempty</code> will generate a pure <code>Poll</code> around <code>mempty</code> of the underlying <code>Monoid</code>.</p>"
              {}
          ]
      ]
  }
