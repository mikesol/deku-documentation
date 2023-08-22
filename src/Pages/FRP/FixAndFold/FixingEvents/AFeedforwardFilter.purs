module Pages.FRP.FixAndFold.FixingEvents.AFeedforwardFilter where

import Prelude

import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.DOM.Attributes as DA
import Deku.DOM as D

aFeedforwardFilter :: Subsection
aFeedforwardFilter = subsection
  { title: "A feedforward filter"
  , matter: pure
      [ D.p_
          [ text_ "This subsection will be about "
          , D.span [ DA.klass_ "font-bold" ] [ text_ "A feedforward filter" ]
          , text_ "."
          ]
      ]
  }
