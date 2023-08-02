module Pages.FRP.Behaviors.Applicative.BehaviorsAsFunctors where

import Prelude

import Components.Code (psCode)
import Contracts (Subsection, subsection)
import Deku.Control (text)
import Deku.DOM as D

behaviorsAsFunctors :: Subsection
behaviorsAsFunctors = subsection
  { title: "Behaviors as functors"
  , matter: pure
      [ D.p_
          [ text "The definition of "
          , D.code__ "Behavior"
          , text "'s instance of functor is similar to that of "
          , D.code__ "Event"
          , text ":"
          ]
      , psCode
          """newtype Behavior a = Behavior (forall b. Event (a -> b) -> Event b)

instance Functor Behavior where
  map (Behavior b) f = Behavior ((lcmap <<< lcmap) f b)
"""
      , D.p_
          [ text
              "The map applies a transformation to the values at the behavior "
          , D.i__ "only at the moment"
          , text " that the behavior is queried by an event."
          ]
      ]
  }
