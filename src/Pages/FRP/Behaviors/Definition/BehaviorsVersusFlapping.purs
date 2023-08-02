module Pages.FRP.Behaviors.Definition.BehaviorsVersusFlapping where

import Prelude

import Components.Code (psCodeWithLink)
import Components.ExampleBlockquote (exampleBlockquote)
import Contracts (Subsection, subsection)
import Data.Functor (mapFlipped)
import Deku.Control (text)
import Deku.DOM as D
import Effect.Random (random)
import Examples as Examples
import FRP.Behavior (behavior, sample)
import FRP.Event.Time (interval)

behaviorsVersusFlapping :: Subsection
behaviorsVersusFlapping = subsection
  { title: "A Behavior in the wild"
  , matter: pure
      [ D.p_
          [ text
              "Let's see a behavior in the wild. Our behavior will observe a random phenomenon, and we'll consult it on a regular interval."
          ]
      , psCodeWithLink Examples.BehaviorsVersusFlapping
      , exampleBlockquote
          [ text
              ( show <$> sample
                  (behavior (flip bindToEffect (mapFlipped random)))
                  (interval 250 $> add 42.0)
              )
          ]
      , D.p_
          [ text "The "
          , D.code__ "sample"
          , text " function samples a behavior on an event, and the "
          , D.code__ "behavior"
          , text " function constructs a "
          , D.code__ "Behavior a"
          , text " from a term of type "
          , D.code__ "forall b. Event (a -> b) -> Event a"
          , text "."
          ]
      ]
  }
