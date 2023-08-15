module Pages.FRP.Polls.Calculus where

import Prelude

import Contracts (Section, section)
import Deku.Control (text, text_)
import Deku.DOM as D
import Pages.FRP.Polls.Calculus.IntegratingPolls (integratingPolls)
import Pages.FRP.Polls.Calculus.DerivingPolls (derivingPolls)
import Pages.FRP.Polls.Calculus.SolvingDifferentialEquations (solvingDifferentialEquations)

calculus :: Section
calculus = section
  { title: "Calculus"
  , topmatter: pure
      [ D.p_
          [ text
              "Because polls are continuous functions of time, one can perform classic time-domain operations on them like derivation and integration. You can even solve differential equations using polls. Let's see how!"
          ]
      ]
  , subsections:
      [ --pollsAsContinuousFunctionsOfTime
        --, 
        derivingPolls
      , integratingPolls
      , solvingDifferentialEquations
      ]
  }
