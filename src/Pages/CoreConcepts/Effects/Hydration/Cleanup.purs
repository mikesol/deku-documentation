module Pages.CoreConcepts.Effects.Hydration.Cleanup where

import Prelude

import Contracts (Subsection, subsection)
import Deku.Control (text, text_)
import Deku.Attribute ((:=), (<:=>), (!:=))
import Deku.DOM as D

cleanup :: Subsection
cleanup = subsection
  { title: "Cleanup"
  , matter: pure
      [ D.p_
          [ text_ "This subsection will be about "
          , D.span [ D.Class !:= "font-bold" ] [ text_ "Cleanup" ]
          , text_ "."
          ]
      ]
  }
