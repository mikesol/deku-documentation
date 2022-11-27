module Pages.FRP.Behaviors.Calculus.BehaviorsAsContinuousFunctionsOfTime where

import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

behaviorsAsContinuousFunctionsOfTime
  :: forall lock payload. Subsection lock payload
behaviorsAsContinuousFunctionsOfTime = subsection
  { title: "Behaviors as continuous functions of time"
  , matter:
      [ D.p_
          [ text_ "This subsection will be about "
          , D.span (D.Class !:= "font-bold")
              [ text_ "Behaviors as continuous functions of time" ]
          , text_ "."
          ]
      ]
  }
