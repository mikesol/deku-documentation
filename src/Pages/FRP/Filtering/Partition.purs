module Pages.FRP.Filtering.Partition where

import Prelude

import Contracts (Section, section)
import Deku.Control (text)
import Deku.Attribute ((:=))
import Deku.DOM as D
import Pages.FRP.Filtering.Partition.PerformanceConsiderations (performanceConsiderations)
import Pages.FRP.Filtering.Partition.PartitioningAnEvent (partitioningAnEvent)

partition :: Section
partition = section
  { title: "Partition"
  , topmatter: pure
      [ D.p_
          [ text "This section will be about "
          , D.span [ D.Class := "font-bold" ] [ text "Partition" ]
          , text "."
          ]
      ]
  , subsections:
      [ partitioningAnEvent, {-multiPartitioning,-} performanceConsiderations ]
  }
