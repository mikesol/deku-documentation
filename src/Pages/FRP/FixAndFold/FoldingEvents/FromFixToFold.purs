module Pages.FRP.FixAndFold.FoldingEvents.FromFixToFold where

import Prelude

import Contracts (Subsection, subsection)
import Deku.Control (text)
import Deku.Attribute ((:=))
import Deku.DOM as D

fromFixToFold :: Subsection
fromFixToFold = subsection
  { title: "From fix to fold"
  , matter: pure
      [ D.p_
          [ text "This subsection will be about "
          , D.span [ D.Class := "font-bold" ] [ text "From fix to fold" ]
          , text "."
          ]
      ]
  }
