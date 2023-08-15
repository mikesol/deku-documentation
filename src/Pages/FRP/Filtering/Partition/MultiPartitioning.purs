module Pages.FRP.Filtering.Partition.MultiPartitioning where

import Prelude

import Contracts (Subsection, subsection)
import Deku.Control (text, text_)
import Deku.Attribute ((:=), (<:=>), (!:=))
import Deku.DOM as D

multiPartitioning :: Subsection
multiPartitioning = subsection
  { title: "Multi-partitioning"
  , matter: pure
      [ D.p_
          [ text_ "This subsection will be about "
          , D.span [ D.Class !:= "font-bold" ] [ text_ "Multi-partitioning" ]
          , text_ "."
          ]
      ]
  }
