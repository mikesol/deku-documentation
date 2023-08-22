module Pages.FRP.Filtering.Partition where

import Prelude

import Contracts (Section, section)
import Deku.Control (text, text_)
import Deku.DOM.Attributes as DA
import Deku.DOM as D
import Pages.FRP.Filtering.Partition.PerformanceConsiderations (performanceConsiderations)
import Pages.FRP.Filtering.Partition.PartitioningAnEvent (partitioningAnEvent)

partition :: Section
partition = section
  { title: "Partition"
  , topmatter: pure
      [ D.p_
          [ text_ "This section will be about "
          , D.span [ DA.klass_ "font-bold" ] [ text_ "Partition" ]
          , text_ "."
          ]
      ]
  , subsections:
      [ partitioningAnEvent, {-multiPartitioning,-} performanceConsiderations ]
  }
