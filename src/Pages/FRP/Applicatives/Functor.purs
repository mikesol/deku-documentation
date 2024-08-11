module Pages.FRP.Applicatives.Functor where

import Prelude

import Contracts (Section, section)
import Deku.Control (text, text_)
import Deku.DOM as D
import Pages.FRP.Applicatives.Functor.PerformanceConsiderations (performanceConsiderations)
import Pages.FRP.Applicatives.Functor.TheMeaningOfMap (theMeaningOfMap)

functor :: Section
functor = section
  { title: "Events as functors"
  , topmatter: pure
      [ D.p_
          [ text_ "As we've seen in Deku, to do anything interesting with an "
          , D.code__ "Event"
          , text_
              " we need to map over it. In this section, we’ll learn how to define "
          , D.code__ "map"
          , text_ " for "
          , D.code__ "Event"
          , text_ " and discuss its performance characteristics."
          ]
      ]
  , subsections:
      [ theMeaningOfMap, performanceConsiderations ]
  }
