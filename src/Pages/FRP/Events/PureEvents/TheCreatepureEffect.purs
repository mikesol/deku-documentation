module Pages.FRP.Events.PureEvents.TheCreatepureEffect where

import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

theCreatepureEffect :: forall lock payload. Subsection lock payload
theCreatepureEffect = subsection
  { title: "The createPure effect"
  , matter:
      [ D.p_
          [ text_ "This subsection will be about "
          , D.span (D.Class !:= "font-bold") [ text_ "The createPure effect" ]
          , text_ "."
          ]
      ]
  }
