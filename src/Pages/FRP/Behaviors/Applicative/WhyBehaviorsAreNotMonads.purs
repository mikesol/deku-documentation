module Pages.FRP.Polls.Applicative.WhyPollsAreNotMonads where

import Prelude

import Contracts (Subsection, subsection)
import Deku.Control (text, text_)
import Deku.DOM as D

whyPollsAreNotMonads :: Subsection
whyPollsAreNotMonads = subsection
  { title: "Polls are monads"
  , matter: pure
      [ D.p_
          [ text
              "Write me."
          ]
      ]
  }
