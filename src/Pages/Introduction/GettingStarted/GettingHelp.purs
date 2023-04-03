module Pages.Introduction.GettingStarted.GettingHelp where

import Prelude

import Contracts (Section, section)
import Deku.Control (text_)
import Deku.DOM as D
import Pages.Introduction.GettingStarted.GettingHelp.JoinTheCommunity (joinTheCommunity)
import Pages.Introduction.GettingStarted.GettingHelp.SubmitAnIssue (submitAnIssue)

gettingHelp :: Section
gettingHelp = section
  { title: "Getting help"
  , topmatter: pure
      [ D.p_
          [ text_ "Run into a snag? There are several ways you can get help!"
          ]
      ]
  , subsections:
      [ submitAnIssue, joinTheCommunity ]
  }
