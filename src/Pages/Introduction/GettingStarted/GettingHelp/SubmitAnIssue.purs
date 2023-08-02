module Pages.Introduction.GettingStarted.GettingHelp.SubmitAnIssue where

import Prelude

import Contracts (Subsection, subsection)
import Deku.Attribute ((:=))
import Deku.Control (text)
import Deku.DOM as D

submitAnIssue :: Subsection
submitAnIssue = subsection
  { title: "Submit an issue"
  , matter: pure
      [ D.p_
          [ text
              "If you spot an issue with the Deku framework itself or if you have feature requests, please open an issue on the "
          , D.a
              [ D.Href := "https://github.com/mikesol/purescript-deku/issues" ]
              [ text "Deku issues" ]
          , text
              " page.  If you find an issue in this documentation, please open an issue on the "
          , D.a
              [ D.Href :=
                  "https://github.com/mikesol/deku-documentation/issues"
              ]
              [ text "Deku Documentation issues" ]
          , text " page."
          ]
      ]
  }