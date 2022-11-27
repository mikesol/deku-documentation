module Pages.FRP.Filtering.Filter.FilteringAnEvent where

import Prelude

import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

filteringAnEvent :: forall lock payload. Subsection lock payload
filteringAnEvent = subsection
  { title: "Filtering an event"
  , matter: pure
      [ D.p_
          [ text_ "This subsection will be about "
          , D.span (D.Class !:= "font-bold") [ text_ "Filtering an event" ]
          , text_ "."
          ]
      ]
  }
