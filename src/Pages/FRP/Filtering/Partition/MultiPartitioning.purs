module Pages.FRP.Filtering.Partition.MultiPartitioning where

import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

multiPartitioning :: forall lock payload. Subsection lock payload
multiPartitioning = subsection
  { title: "Multi-partitioning"
  , matter:
      [ D.p_
          [ text_ "This subsection will be about "
          , D.span (D.Class !:= "font-bold") [ text_ "Multi-partitioning" ]
          , text_ "."
          ]
      ]
  }
