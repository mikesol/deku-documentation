module Pages.FRP.Behaviors.Calculus where

import Prelude

import Contracts (Section, section)
import Deku.Control (text)
import Deku.DOM as D
import Pages.FRP.Behaviors.Calculus.IntegratingBehaviors (integratingBehaviors)
import Pages.FRP.Behaviors.Calculus.DerivingBehaviors (derivingBehaviors)
import Pages.FRP.Behaviors.Calculus.SolvingDifferentialEquations (solvingDifferentialEquations)

calculus :: Section
calculus = section
  { title: "Calculus"
  , topmatter: pure
      [ D.p_
          [ text
              "Because behaviors are continuous functions of time, one can perform classic time-domain operations on them like derivation and integration. You can even solve differential equations using behaviors. Let's see how!"
          ]
      ]
  , subsections:
      [ --behaviorsAsContinuousFunctionsOfTime
        --, 
        derivingBehaviors
      , integratingBehaviors
      , solvingDifferentialEquations
      ]
  }
