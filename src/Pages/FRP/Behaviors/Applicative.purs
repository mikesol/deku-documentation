module Pages.FRP.Polls.Applicative where

import Prelude

import Contracts (Section, section)
import Deku.Control (text_)
import Deku.DOM as D
import Pages.FRP.Polls.Applicative.PollsAsApplicatives (pollsAsApplicatives)
import Pages.FRP.Polls.Applicative.PollsAsFunctors (pollsAsFunctors)

applicative :: Section
applicative = section
  { title: "Applicative"
  , topmatter: pure
      [ D.p_
          [ text_
              "Polls are applicative functors. Let's see what that means in practice, starting at functors and stopping just shy of monads."
          ]
      ]
  , subsections:
      [ pollsAsFunctors, pollsAsApplicatives ]
  }
