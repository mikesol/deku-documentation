module Pages.FRP.Behaviors.Definition.BehaviorsAndYoneda where

import Prelude

import Contracts (Subsection, subsection)
import Deku.Control (text)
import Deku.Attribute ((:=))
import Deku.DOM as D

behaviorsAndYoneda :: Subsection
behaviorsAndYoneda = subsection
  { title: "Behaviors and Yoneda"
  , matter: pure
      [ D.p_
          [ text "This subsection will be about "
          , D.span [ D.Class := "font-bold" ] [ text "Behaviors and Yoneda" ]
          , text "."
          ]
      ]
  }
