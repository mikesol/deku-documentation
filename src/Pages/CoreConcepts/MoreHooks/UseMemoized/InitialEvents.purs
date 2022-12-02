module Pages.CoreConcepts.MoreHooks.UseMemoized.InitialEvents where

import Prelude

import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

initialEvents :: forall lock payload. Subsection lock payload
initialEvents = subsection
  { title: "Without an event"
  , matter: pure
      [ D.p_
          [ text_ "This subsection will be about "
          , D.span (D.Class !:= "font-bold") [ text_ "Initial events" ]
          , text_ "."
          ]
      ]
  }
