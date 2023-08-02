module Pages.FRP.Filtering.Partition.PartitioningAnEvent where

import Prelude

import Contracts (Subsection, subsection)
import Deku.Control (text)
import Deku.Attribute ((:=))
import Deku.DOM as D

partitioningAnEvent :: Subsection
partitioningAnEvent = subsection
  { title: "Partitioning an event"
  , matter: pure
      [ D.p_
          [ text "This subsection will be about "
          , D.span [ D.Class := "font-bold" ] [ text "Partitioning an event" ]
          , text "."
          ]
      ]
  }
