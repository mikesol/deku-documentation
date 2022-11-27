module Pages.FRP.FixAndFold.FixingEvents.AFeedforwardFilter where

import Prelude

import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

aFeedforwardFilter :: forall lock payload. Subsection lock payload
aFeedforwardFilter = subsection
  { title: "A feedforward filter"
  , matter: pure
      [ D.p_
          [ text_ "This subsection will be about "
          , D.span (D.Class !:= "font-bold") [ text_ "A feedforward filter" ]
          , text_ "."
          ]
      ]
  }
