module Pages.FRP.Behaviors.Applicative.BehaviorsAsFunctors where

import Prelude

import Components.Code (psCode)
import Contracts (Subsection, subsection)
import Deku.Attribute ((!:=))
import Deku.Control (text_)
import Deku.DOM as D

behaviorsAsFunctors :: Subsection
behaviorsAsFunctors = subsection
  { title: "Behaviors as functors"
  , matter: pure
      [ D.p_
          [ text_ "The definition of "
          , D.code__ "Behavior"
          , text_ "'s instance of functor is similar to that of "
          , D.code__ "Event"
          , text_ ":"
          ]
      , psCode
          """newtype Behavior a = Behavior (forall b. Event (a -> b) -> Event b)

instance Functor Behavior where
  map (Behavior b) f = Behavior ((lcmap <<< lcmap) f b)
"""
      , D.p_
          [ text_
              "The map applies a transformation to the values at the behavior "
          , D.i__ "only at the moment"
          , text_ " that the behavior is queried by an event."
          ]
      ]
  }
