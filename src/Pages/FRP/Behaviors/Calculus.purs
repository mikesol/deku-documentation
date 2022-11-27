module Pages.FRP.Behaviors.Calculus where

import Contracts (Section, section)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D
import Pages.FRP.Behaviors.Calculus.IntegratingBehaviors (integratingBehaviors)
import Pages.FRP.Behaviors.Calculus.BehaviorsAsContinuousFunctionsOfTime (behaviorsAsContinuousFunctionsOfTime)
import Pages.FRP.Behaviors.Calculus.DerivingBehaviors (derivingBehaviors)
import Pages.FRP.Behaviors.Calculus.SolvingDifferentialEquations (solvingDifferentialEquations)

calculus :: forall lock payload. Section lock payload
calculus = section
  { title: "Calculus"
  , topmatter:
      [ D.p_
          [ text_ "This section will be about "
          , D.span (D.Class !:= "font-bold") [ text_ "Calculus" ]
          , text_ "."
          ]
      ]
  , subsections:
      [ integratingBehaviors
      , behaviorsAsContinuousFunctionsOfTime
      , derivingBehaviors
      , solvingDifferentialEquations
      ]
  }
