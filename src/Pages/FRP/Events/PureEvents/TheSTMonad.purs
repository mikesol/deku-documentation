module Pages.FRP.Events.PureEvents.TheSTMonad where

import Prelude

import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

theSTMonad :: forall lock payload. Subsection lock payload
theSTMonad = subsection
  { title: "The ST monad"
  , matter: pure
      [ D.p_
          [ text_ "This subsection will be about "
          , D.span (D.Class !:= "font-bold") [ text_ "The ST monad" ]
          , text_ "."
          ]
      ]
  }
