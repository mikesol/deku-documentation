module Pages.FRP.Behaviors.Applicative where

import Prelude

import Contracts (Section, section)
import Deku.Control (text)
import Deku.DOM as D
import Pages.FRP.Behaviors.Applicative.WhyBehaviorsAreNotMonads (whyBehaviorsAreNotMonads)
import Pages.FRP.Behaviors.Applicative.BehaviorsAsApplicatives (behaviorsAsApplicatives)
import Pages.FRP.Behaviors.Applicative.BehaviorsAsFunctors (behaviorsAsFunctors)

applicative :: Section
applicative = section
  { title: "Applicative"
  , topmatter: pure
      [ D.p_
          [ text
              "Behaviors are applicative functors. Let's see what that means in practice, starting at functors and stopping just shy of monads."
          ]
      ]
  , subsections:
      [ behaviorsAsFunctors, behaviorsAsApplicatives, whyBehaviorsAreNotMonads ]
  }
