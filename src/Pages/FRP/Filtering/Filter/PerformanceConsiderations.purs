module Pages.FRP.Filtering.Filter.PerformanceConsiderations where

import Prelude

import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

performanceConsiderations :: forall lock payload. Subsection lock payload
performanceConsiderations = subsection
  { title: "Performance considerations"
  , matter: pure
      [ D.p_
          [ text_ "If you use the same filter multiple times, it creates a new subscription for each filter. Consider coupling filter with ", D.code__ "useMemoized", text_ " to make things faster if needed."
          ]
      ]
  }
