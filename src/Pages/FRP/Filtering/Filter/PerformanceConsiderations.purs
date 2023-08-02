module Pages.FRP.Filtering.Filter.PerformanceConsiderations where

import Prelude

import Contracts (Subsection, subsection)
import Deku.Control (text)
import Deku.DOM as D

performanceConsiderations :: Subsection
performanceConsiderations = subsection
  { title: "Performance considerations"
  , matter: pure
      [ D.p_
          [ text
              "If you use the same filter multiple times, it creates a new subscription for each filter. Consider coupling filter with "
          , D.code__ "useMemoized"
          , text " to make things faster if needed."
          ]
      ]
  }
