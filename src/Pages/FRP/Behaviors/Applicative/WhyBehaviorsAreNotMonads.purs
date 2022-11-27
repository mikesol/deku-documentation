module Pages.FRP.Behaviors.Applicative.WhyBehaviorsAreNotMonads where

import Prelude


import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

whyBehaviorsAreNotMonads :: forall lock payload. Subsection lock payload
whyBehaviorsAreNotMonads = subsection
  { title: "Why behaviors aren't monads"
  , matter: pure
      [ D.p_
          [ text_ "This subsection will be about "
          , D.span (D.Class !:= "font-bold")
              [ text_ "Why behaviors aren't monads" ]
          , text_ "."
          ]
      ]
  }
