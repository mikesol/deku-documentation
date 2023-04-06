module Pages.FRP.Behaviors.Applicative.WhyBehaviorsAreNotMonads where

import Prelude

import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

whyBehaviorsAreNotMonads :: Subsection
whyBehaviorsAreNotMonads = subsection
  { title: "Why behaviors aren't monads"
  , matter: pure
      [ D.p_
          [ text_
              "Behaviors are not monads because, while we can technically derive a definition that satisfies the laws, it is often not useful to think about a "
          , D.code__ "Behavior"
          , text_ " monadically. A "
          , D.code__ "Behavior"
          , text_ " is a good candidate for"
          , D.code__ "Applicative"
          , text_
              " because there is a clean notion of how to accumulate its effects. At any point in time, two behaviors can have their values summed and their effects multiplied over time."
          ]
      , D.p_
          [ text_
              "Monads, on the other hand, would require us to do something with a behavior of behaviors. We'd have to say \"at any given point of time, this behavior yields a behavior, which then yields a value.\" This would make working with behaviors quite tricky. Instead, we opt for continuous functions of time (instead of continuous functions of continuous functions of time) because they are easier to reason about."
          ]
      ]
  }
