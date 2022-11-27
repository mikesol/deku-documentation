module Pages.CoreConcepts.MoreHooks.UseMemoized.TransformedEvents where

import Prelude

import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

transformedEvents :: forall lock payload. Subsection lock payload
transformedEvents = subsection
  { title: "Transformed events"
  , matter: pure
      [ D.p_
          [ text_ "This subsection will be about "
          , D.span (D.Class !:= "font-bold") [ text_ "Transformed events" ]
          , text_ "."
          ]
      ]
  }
