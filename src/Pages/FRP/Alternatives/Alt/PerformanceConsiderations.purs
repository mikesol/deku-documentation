module Pages.FRP.Alternatives.Alt.PerformanceConsiderations where

import Prelude

import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.DOM as D

performanceConsiderations :: Subsection
performanceConsiderations = subsection
  { title: "Performance considerations"
  , matter: pure
      [ D.p_
          [ text_ "Because "
          , D.code__ "<|>"
          , text_
              " adds an extra thunk to your stack, too many of them can degrade performance. To aleviate this, you can use the function "
          , D.code__ "merge"
          , text_ " from "
          , D.code__ "hyrule"
          , text_
              ", which has the same signature as "
          , D.code__ "oneOf"
          , text_ " but without the overhead of "
          , D.code__ "Alt"
          , text_ "."
          ]
      ]
  }
