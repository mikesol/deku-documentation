module Pages.FRP.Behaviors.Calculus.SolvingDifferentialEquations where

import Prelude

import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

solvingDifferentialEquations :: forall lock payload. Subsection lock payload
solvingDifferentialEquations = subsection
  { title: "Solving differential equations"
  , matter: pure
      [ D.p_
          [ text_ "This subsection will be about "
          , D.span (D.Class !:= "font-bold")
              [ text_ "Solving differential equations" ]
          , text_ "."
          ]
      ]
  }
