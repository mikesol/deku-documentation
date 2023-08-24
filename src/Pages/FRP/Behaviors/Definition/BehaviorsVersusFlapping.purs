module Pages.FRP.Polls.Definition.PollsVersusFlapping where

import Prelude

import Contracts (CollapseState(..), Subsection, getExample, subsection)
import Data.Maybe (Maybe(..))
import Deku.Control (text, text_)
import Deku.DOM as D
import Examples as Examples

pollsVersusFlapping :: Subsection
pollsVersusFlapping = subsection
  { title: "A Poll in the wild"
  , matter: do
      example <- getExample StartCollapsed Nothing
        Examples.PollsVersusFlapping
      pure
        [ D.p_
            [ text_
                "Let's see a poll in the wild. Our poll will observe a random phenomenon, and we'll consult it on a regular interval."
            ]
        , example
        , D.p_
            [ text_ "The "
            , D.code__ "sample"
            , text_ " function samples a poll on an event, and the "
            , D.code__ "poll"
            , text_ " function constructs a "
            , D.code__ "Poll a"
            , text_ " from a term of type "
            , D.code__ "forall b. Event (a -> b) -> Event a"
            , text_ "."
            ]
        ]
  }
