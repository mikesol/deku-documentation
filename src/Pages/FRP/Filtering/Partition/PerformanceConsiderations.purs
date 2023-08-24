module Pages.FRP.Filtering.Partition.PerformanceConsiderations where

import Prelude

import Contracts (Subsection, subsection)
import Deku.Control (text, text_)
import Deku.DOM.Attributes as DA
import Deku.DOM as D

performanceConsiderations :: Subsection
performanceConsiderations = subsection
  { title: "Performance considerations"
  , matter: pure
      [ D.p_
          [ text_ "This subsection will be about "
          , D.span [ DA.klass_ "font-bold" ]
              [ text_ "Performance considerations" ]
          , text_ "."
          ]
      ]
  }
