module Pages.FRP.FixAndFold.FoldingEvents.FoldIsState where

import Prelude

import Contracts (Subsection, subsection)
import Deku.Control (text)
import Deku.Attribute ((:=))
import Deku.DOM as D

foldIsState :: Subsection
foldIsState = subsection
  { title: "Fold is state"
  , matter: pure
      [ D.p_
          [ text "This subsection will be about "
          , D.span [ D.Class := "font-bold" ] [ text "Fold is state" ]
          , text "."
          ]
      ]
  }
