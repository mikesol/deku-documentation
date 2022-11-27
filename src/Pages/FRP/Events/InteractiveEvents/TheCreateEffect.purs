module Pages.FRP.Events.InteractiveEvents.TheCreateEffect where

import Prelude

import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

theCreateEffect :: forall lock payload. Subsection lock payload
theCreateEffect = subsection
  { title: "The create effect"
  , matter: pure
      [ D.p_
          [ text_ "This subsection will be about "
          , D.span (D.Class !:= "font-bold") [ text_ "The create effect" ]
          , text_ "."
          ]
      ]
  }
