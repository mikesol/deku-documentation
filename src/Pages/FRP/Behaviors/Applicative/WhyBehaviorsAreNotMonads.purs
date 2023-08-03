module Pages.FRP.Behaviors.Applicative.WhyBehaviorsAreNotMonads where

import Prelude

import Contracts (Subsection, subsection)
import Deku.Control (text)
import Deku.DOM as D

whyBehaviorsAreNotMonads :: Subsection
whyBehaviorsAreNotMonads = subsection
  { title: "Behaviors are monads"
  , matter: pure
      [ D.p_
          [ text
              "Write me."
          ]
      ]
  }
