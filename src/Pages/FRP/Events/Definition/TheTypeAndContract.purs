module Pages.FRP.Events.Definition.TheTypeAndContract where

import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

theTypeAndContract :: forall lock payload. Subsection lock payload
theTypeAndContract = subsection
  { title: "The type and contract"
  , matter:
      [ D.p_
          [ text_ "This subsection will be about "
          , D.span (D.Class !:= "font-bold") [ text_ "The type and contract" ]
          , text_ "."
          ]
      ]
  }
