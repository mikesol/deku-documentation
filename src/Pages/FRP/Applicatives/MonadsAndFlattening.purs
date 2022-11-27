module Pages.FRP.Applicatives.MonadsAndFlattening where

import Contracts (Section, section)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D
import Pages.FRP.Applicatives.MonadsAndFlattening.TheKeepLatestFunction (theKeepLatestFunction)
import Pages.FRP.Applicatives.MonadsAndFlattening.EventAsAMonad (eventAsAMonad)

monadsAndFlattening :: forall lock payload. Section lock payload
monadsAndFlattening = section
  { title: "Monads and flattening"
  , topmatter:
      [ D.p_
          [ text_ "This section will be about "
          , D.span (D.Class !:= "font-bold") [ text_ "Monads and flattening" ]
          , text_ "."
          ]
      ]
  , subsections:
      [ eventAsAMonad, theKeepLatestFunction ]
  }
