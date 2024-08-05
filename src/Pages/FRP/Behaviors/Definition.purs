module Pages.FRP.Polls.Definition where

import Prelude

import Contracts (Section, section)
import Deku.Control (text, text_)
import Deku.DOM as D
import Pages.FRP.Polls.Definition.ThePollType (thePollType)
import Pages.FRP.Polls.Definition.PollsVersusFlapping (pollsVersusFlapping)

definition :: Section
definition = section
  { title: "Definition"
  , topmatter: pure
      [ D.p_
          [ text_
              "What is a poll? Well, what "
          , D.i__ "isn't"
          , text_
              " a poll. Actually, a lot of stuff isn't a poll, so let's just stick with what is. This section will define our new friend "
          , D.code__ "Poll"
          , text_
              ", explore the manifold nuances therein, and present a small example of a Poll being used in the browser."
          ]
      ]
  , subsections:
      [ thePollType, pollsVersusFlapping {-, pollsAndYoneda-} ]
  }
