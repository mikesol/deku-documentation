module Pages.CoreConcepts.MoreHooks.UseMemoized where

import Prelude


import Contracts (Section, section)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D
import Pages.CoreConcepts.MoreHooks.UseMemoized.TransformedEvents (transformedEvents)
import Pages.CoreConcepts.MoreHooks.UseMemoized.InitialEvents (initialEvents)

useMemoized :: forall lock payload. Section lock payload
useMemoized = section
  { title: "Use memoized"
  , topmatter: pure
      [ D.p_
          [ text_ "This section will be about "
          , D.span (D.Class !:= "font-bold") [ text_ "Use memoized" ]
          , text_ "."
          ]
      ]
  , subsections:
      [ transformedEvents, initialEvents ]
  }
