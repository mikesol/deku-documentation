module Pages.FRP.Polls.OtherInstances where

import Prelude

import Contracts (Section, section)
import Deku.Pursx (pursx)
import Pages.FRP.Polls.OtherInstances.PollsAsHeytingAlgebras (pollsAsHeytingAlgebras)
import Pages.FRP.Polls.OtherInstances.PollsAsMonoids (pollsAsMonoids)
import Pages.FRP.Polls.OtherInstances.PollsAsRings (pollsAsRings)

otherInstances :: Section
otherInstances = section
  { title: "Other instances"
  , topmatter: pure
      [ pursx
          @"<p>Like <code>Event</code>s, <code>Poll</code>s come supercharged with several instances that make working with them easier.</p>"
          {}

      ]
  , subsections:
      [ pollsAsMonoids, pollsAsHeytingAlgebras, pollsAsRings ]
  }
