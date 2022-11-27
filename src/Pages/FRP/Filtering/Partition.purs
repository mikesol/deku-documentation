module Pages.FRP.Filtering.Partition where

import Contracts (Section, section)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D
import Pages.FRP.Filtering.Partition.PerformanceConsiderations (performanceConsiderations)
import Pages.FRP.Filtering.Partition.PartitioningAnEvent (partitioningAnEvent)
import Pages.FRP.Filtering.Partition.MultiPartitioning (multiPartitioning)

partition :: forall lock payload. Section lock payload
partition = section
  { title: "Partition"
  , topmatter:
      [ D.p_
          [ text_ "This section will be about "
          , D.span (D.Class !:= "font-bold") [ text_ "Partition" ]
          , text_ "."
          ]
      ]
  , subsections:
      [ performanceConsiderations, partitioningAnEvent, multiPartitioning ]
  }
