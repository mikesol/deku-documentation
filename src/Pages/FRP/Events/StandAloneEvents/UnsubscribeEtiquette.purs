module Pages.FRP.Events.StandAloneEvents.UnsubscribeEtiquette where

import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

unsubscribeEtiquette :: forall lock payload. Subsection lock payload
unsubscribeEtiquette = subsection
  { title: "Unsubscribe etiquette"
  , matter:
      [ D.p_
          [ text_ "This subsection will be about "
          , D.span (D.Class !:= "font-bold") [ text_ "Unsubscribe etiquette" ]
          , text_ "."
          ]
      ]
  }
