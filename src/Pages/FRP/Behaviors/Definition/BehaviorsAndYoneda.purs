module Pages.FRP.Behaviors.Definition.BehaviorsAndYoneda where

import Prelude

import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

behaviorsAndYoneda :: Subsection
behaviorsAndYoneda = subsection
  { title: "Behaviors and Yoneda"
  , matter: pure
      [ D.p_
          [ text_ "This subsection will be about "
          , D.span [ D.Class !:= "font-bold" ] [ text_ "Behaviors and Yoneda" ]
          , text_ "."
          ]
      ]
  }
