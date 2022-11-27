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
          [ text_ "This section will be about "
          , D.span (D.Class !:= "font-bold") [ text_ "Folding events" ]
          , text_ "."
          ]
      ]
  , subsections:
      [ theFoldFunction
      , aSimpleCounter
      , foldIsState
      , fromFixToFold
      , whenToFixAndWhenToFold
      ]
  }
