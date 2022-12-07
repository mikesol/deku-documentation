module Pages.FRP.FixAndFold.FoldingEvents where

import Prelude

import Contracts (Section, section)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D
import Pages.FRP.FixAndFold.FoldingEvents.ASimpleCounter (aSimpleCounter)
import Pages.FRP.FixAndFold.FoldingEvents.FoldIsState (foldIsState)
import Pages.FRP.FixAndFold.FoldingEvents.TheFoldFunction (theFoldFunction)
import Pages.FRP.FixAndFold.FoldingEvents.WhenToFixAndWhenToFold (whenToFixAndWhenToFold)
import Pages.FRP.FixAndFold.FoldingEvents.FromFixToFold (fromFixToFold)

foldingEvents :: forall lock payload. Section lock payload
foldingEvents = section
  { title: "Folding events"
  , topmatter: pure
      [ D.p_
          [ text_ "One special category of "
          , D.code__ "fix"
          , text_ "ing is "
          , D.code__ "fold"
          , text_ "ing. In this section, we'll define the "
          , D.code__ "fold"
          , text_ " function from "
          , D.code__ "fix"
          , text_ ", build a simple counter using "
          , D.code__ "fold"
          , text_ ", and discuss when to use one versus the other."
          ]
      ]
  , subsections:
      [ theFoldFunction
      , aSimpleCounter
      --, foldIsState
      --, fromFixToFold
      , whenToFixAndWhenToFold
      ]
  }
