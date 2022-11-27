module Pages.FRP.Applicatives.MonadsAndFlattening.EventAsAMonad where

import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

eventAsAMonad :: forall lock payload. Subsection lock payload
eventAsAMonad = subsection
  { title: "Event as a monad"
  , matter:
      [ D.p_
          [ text_ "This subsection will be about "
          , D.span (D.Class !:= "font-bold") [ text_ "Event as a monad" ]
          , text_ "."
          ]
      ]
  }
