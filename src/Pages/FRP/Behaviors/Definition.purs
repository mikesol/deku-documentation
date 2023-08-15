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
          [ text
              "This section will look at how polls are defined, explore the nuance of the definition, and present a small example of a Poll being used in the browser."
          ]
      ]
  , subsections:
      [ thePollType, pollsVersusFlapping {-, pollsAndYoneda-} ]
  }
