module Pages.FRP.Alternatives.Plus where

import Prelude


import Contracts (Section, section)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D
import Pages.FRP.Alternatives.Plus.LawfullyAlternative (lawfullyAlternative)
import Pages.FRP.Alternatives.Plus.Emptiness (emptiness)

plus :: forall lock payload. Section lock payload
plus = section
  { title: "Plus"
  , topmatter: pure
      [ D.p_
          [ text_ "This section will be about "
          , D.span (D.Class !:= "font-bold") [ text_ "Plus" ]
          , text_ "."
          ]
      ]
  , subsections:
      [ emptiness, lawfullyAlternative ]
  }
