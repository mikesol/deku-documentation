module Pages.FRP.Applicatives.Functor where

import Prelude

import Contracts (Section, section)
import Deku.Control (text)
import Deku.DOM as D
import Pages.FRP.Applicatives.Functor.PerformanceConsiderations (performanceConsiderations)
import Pages.FRP.Applicatives.Functor.TheMeaningOfMap (theMeaningOfMap)

functor :: Section
functor = section
  { title: "Events as functors"
  , topmatter: pure
      [ D.p_
          [ text "As we've seen in Deku, to do anything interesting with an "
          , D.code__ "Event"
          , text
              " we need to map over it. In this section, we'll learn how to define "
          , D.code__ "map"
          , text " for "
          , D.code__ "Event"
          , text " and discuss its performance characteristics."
          ]
      ]
  , subsections:
      [ theMeaningOfMap, performanceConsiderations ]
  }
