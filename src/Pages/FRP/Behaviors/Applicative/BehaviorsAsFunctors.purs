module Pages.FRP.Polls.Applicative.PollsAsFunctors where

import Prelude

import Components.Code (psCode)
import Contracts (Subsection, subsection)
import Deku.Control (text, text_)
import Deku.DOM as D

pollsAsFunctors :: Subsection
pollsAsFunctors = subsection
  { title: "Polls as functors"
  , matter: pure
      [ D.p_
          [ text_ "The definition of "
          , D.code__ "Poll"
          , text_ "'s instance of functor is similar to that of "
          , D.code__ "Event"
          , text_ ":"
          ]
      , psCode
          """newtype Poll a = Poll (forall b. Event (a -> b) -> Event b)

instance Functor Poll where
  map (Poll b) f = Poll ((lcmap <<< lcmap) f b)
"""
      , D.p_
          [ text
              "The map applies a transformation to the values at the poll "
          , D.i__ "only at the moment"
          , text_ " that the poll is queried by an event."
          ]
      ]
  }
