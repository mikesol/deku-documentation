module Pages.FRP.Polls.Calculus.SolvingDifferentialEquations where

import Prelude

import Contracts (CollapseState(..), Subsection, getExample, subsection)
import Data.Maybe (Maybe(..))
import Deku.Control (text, text_)
import Deku.DOM as D
import Examples as Examples

solvingDifferentialEquations :: Subsection
solvingDifferentialEquations = subsection
  { title: "Solving differential equations"
  , matter: do
      example <- getExample StartCollapsed Nothing
        Examples.SolvingDifferentialEquations

      pure [ D.p_
          [ text
              "Last but not least, we can solve a second order differential equation of the form "
          , D.code__ "d^2a/dt^2 = f a (da/dt)"
          , text_ " using the "
          , D.code__ "solve2'"
          , text_ " function."
          , text
              " As the left side is the acceleration of the system, we can solve by integrating twice (using the "
          , D.code__ "integrate'"
          , text
              " function above) after specifying the initial conditions for position and velocity. For example, below we create a damped oscillator using the equation "
          , D.code__ "\\x dx'dt -> -⍺ * x - δ * dx'dt"
          , text_ ". In this case, both "
          , D.code__ "x"
          , text_ " (position) and "
          , D.code__ "dx'dt"
          , text_ " (veclocity) are polls."
          ]
      , example
      , D.p__
          "Granted, these methods may not be immediately useful if you're using Deku to build a SaaS dashboard or documentation site. But the day you're hired by the American Calculus Lovers' Association to build their website, you'll have a nice head start!"
      ]
  }
