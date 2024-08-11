module Pages.FRP.Polls.Definition.PollsVersusFlapping where

import Prelude

import Contracts (CollapseState(..), Env(..), Subsection, getExample, getEnv, subsection)
import Data.Maybe (Maybe(..))
import Deku.Control (text_)
import Deku.DOM as D
import Examples as Examples
import Router.ADT (Route(..))

pollsVersusFlapping :: Subsection
pollsVersusFlapping = subsection
  { title: "A Poll in the wild"
  , matter: do
      example <- getExample StartCollapsed Nothing
        Examples.TheStateHook
      Env { routeLink } <- getEnv
      pure
        [ D.p_
            [ text_
                "Let's see a poll in the wild! It'll be a little random number generator controlled by Deku, that framework you learned about a few lessons ago that you're probably already using."
            ]
        , example
        , D.p_
            [ text_
                "Now, you may be thinking, “wait a second, wasn't that the first example from the "
            , routeLink State
            , text_
                " section?” And you'd be right to think that, because it is. Deku runs on "
            , D.code__ "Poll"
            , text_
                "s! As promised earlier in these hallowed docs, I'd give a shoutout once we got to the "
            , D.code__ "Poll"
            , text_
                " section, so consider yourself shout-outed (shot-out? anyone know?)."
            ]
        , D.p_
            [ text_
                "You may be wondering why Deku doesn't just use events, as "
            , D.code__ "Poll"
            , text_
                "s seem like they sort of do the same thing. They do, but the crucial difference is that they have an "
            , D.code__ "Applicative"
            , text_ " instance, which "
            , D.code__ "Event"
            , text_
                " never will. Remember - only seedy Sunday tabloids can create events out of thin air like batboy or a president's love child: the rest of us need to wait for them to happen. So you can't do "
            , D.code__ "pure 42"
            , text_ " and presto-chango get a 42 out of an event. But you "
            , D.i__ "can"
            , text_ " do this with a "
            , D.code__ "Poll"
            , text_ ", and we'll see how and why presently."
            ]
        ]
  }
