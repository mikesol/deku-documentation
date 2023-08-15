module Pages.FRP.Filtering.Partition.PartitioningAnEvent where

import Prelude

import Contracts (Subsection, subsection)
import Deku.Control (text, text_)
import Deku.Attribute ((:=), (<:=>), (!:=))
import Deku.DOM as D

partitioningAnEvent :: Subsection
partitioningAnEvent = subsection
  { title: "Partitioning an event"
  , matter: pure
      [ D.p_
          [ text_ "This subsection will be about "
          , D.span [ D.Class !:= "font-bold" ] [ text_ "Partitioning an event" ]
          , text_ "."
          ]
      ]
  }
