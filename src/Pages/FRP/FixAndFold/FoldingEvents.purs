module Pages.FRP.FixAndFold.FoldingEvents where

import Prelude

import Contracts (Section, section)
import Deku.Control (text)
import Deku.DOM as D
import Pages.FRP.FixAndFold.FoldingEvents.ASimpleCounter (aSimpleCounter)
import Pages.FRP.FixAndFold.FoldingEvents.TheFoldFunction (theFoldFunction)
import Pages.FRP.FixAndFold.FoldingEvents.TimeLeaks (timeLeaks)
import Pages.FRP.FixAndFold.FoldingEvents.WhenToFixAndWhenToFold (whenToFixAndWhenToFold)

foldingEvents :: Section
foldingEvents = section
  { title: "Folding events"
  , topmatter: pure
      [ D.p_
          [ text "One special category of "
          , D.code__ "fix"
          , text "ing is "
          , D.code__ "fold"
          , text "ing. In this section, we'll define the "
          , D.code__ "fold"
          , text " function from "
          , D.code__ "fix"
          , text ", build a simple counter using "
          , D.code__ "fold"
          , text ", and discuss when to use one versus the other."
          ]
      ]
  , subsections:
      [ theFoldFunction
      , aSimpleCounter
      , timeLeaks
      --, foldIsState
      --, fromFixToFold
      , whenToFixAndWhenToFold
      ]
  }
