module Pages.FRP.FixAndFold.FixingEvents.AFeedforwardFilter where

import Prelude

import Contracts (Subsection, subsection)
import Deku.Control (text)
import Deku.Attribute ((:=))
import Deku.DOM as D

aFeedforwardFilter :: Subsection
aFeedforwardFilter = subsection
  { title: "A feedforward filter"
  , matter: pure
      [ D.p_
          [ text "This subsection will be about "
          , D.span [ D.Class := "font-bold" ] [ text "A feedforward filter" ]
          , text "."
          ]
      ]
  }
