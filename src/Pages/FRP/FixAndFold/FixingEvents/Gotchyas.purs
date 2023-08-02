module Pages.FRP.FixAndFold.FixingEvents.Gotchyas where

import Prelude

import Contracts (Subsection, subsection)
import Deku.Control (text)
import Deku.Attribute ((:=))
import Deku.DOM as D

gotchyas :: Subsection
gotchyas = subsection
  { title: "Gotchyas"
  , matter: pure
      [ D.p_
          [ text "This subsection will be about "
          , D.span [ D.Class := "font-bold" ] [ text "Gotchyas" ]
          , text "."
          ]
      ]
  }
