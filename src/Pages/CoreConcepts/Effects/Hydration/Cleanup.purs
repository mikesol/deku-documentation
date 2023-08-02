module Pages.CoreConcepts.Effects.Hydration.Cleanup where

import Prelude

import Contracts (Subsection, subsection)
import Deku.Control (text)
import Deku.Attribute ((:=))
import Deku.DOM as D

cleanup :: Subsection
cleanup = subsection
  { title: "Cleanup"
  , matter: pure
      [ D.p_
          [ text "This subsection will be about "
          , D.span [ D.Class := "font-bold" ] [ text "Cleanup" ]
          , text "."
          ]
      ]
  }
