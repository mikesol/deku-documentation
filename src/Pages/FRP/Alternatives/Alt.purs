module Pages.FRP.Alternatives.Alt where

import Contracts (Section, section)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D
import Pages.FRP.Alternatives.Alt.TheOneOfFunction (theOneOfFunction)
import Pages.FRP.Alternatives.Alt.PerformanceConsiderations (performanceConsiderations)
import Pages.FRP.Alternatives.Alt.AltAsAMuxer (altAsAMuxer)

alt :: forall lock payload. Section lock payload
alt = section
  { title: "Alt"
  , topmatter:
      [ D.p_
          [ text_ "This section will be about "
          , D.span (D.Class !:= "font-bold") [ text_ "Alt" ]
          , text_ "."
          ]
      ]
  , subsections:
      [ theOneOfFunction, performanceConsiderations, altAsAMuxer ]
  }
