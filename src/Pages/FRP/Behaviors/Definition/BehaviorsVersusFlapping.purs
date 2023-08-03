module Pages.FRP.Behaviors.Definition.BehaviorsVersusFlapping where

import Prelude

import Contracts (CollapseState(..), Subsection, getExample, subsection)
import Data.Maybe (Maybe(..))
import Deku.Control (text)
import Deku.DOM as D
import Examples as Examples

behaviorsVersusFlapping :: Subsection
behaviorsVersusFlapping = subsection
  { title: "A Behavior in the wild"
  , matter: do
      example <- getExample StartCollapsed Nothing
        Examples.BehaviorsVersusFlapping
      pure
        [ D.p_
            [ text
                "Let's see a behavior in the wild. Our behavior will observe a random phenomenon, and we'll consult it on a regular interval."
            ]
        , example
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
