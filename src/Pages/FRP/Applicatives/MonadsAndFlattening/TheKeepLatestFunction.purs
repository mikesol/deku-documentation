module Pages.FRP.Applicatives.MonadsAndFlattening.TheKeepLatestFunction where

import Prelude


import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

theKeepLatestFunction :: forall lock payload. Subsection lock payload
theKeepLatestFunction = subsection
  { title: "The keepLatest function"
  , matter: pure
      [ D.p_
          [ text_ "This subsection will be about "
          , D.span (D.Class !:= "font-bold") [ text_ "The keepLatest function" ]
          , text_ "."
          ]
      ]
  }
