module Pages.Introduction.GettingStarted.GettingHelp where

import Contracts (Section, section)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D
import Pages.Introduction.GettingStarted.GettingHelp.JoinTheCommunity (joinTheCommunity)
import Pages.Introduction.GettingStarted.GettingHelp.SubmitAnIssue (submitAnIssue)

gettingHelp :: forall lock payload. Section lock payload
gettingHelp = section
  { title: "Getting help"
  , topmatter:
      [ D.p_
          [ text_ "This section will be about "
            , D.span (D.Class !:= "font-bold") [ text_ "Getting help"]
            , text_ "."
          ]
      ]
  , subsections:
      [ joinTheCommunity,submitAnIssue]
  }
