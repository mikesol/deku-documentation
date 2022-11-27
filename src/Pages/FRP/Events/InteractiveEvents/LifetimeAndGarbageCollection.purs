module Pages.FRP.Events.InteractiveEvents.LifetimeAndGarbageCollection where

import Prelude

import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

lifetimeAndGarbageCollection :: forall lock payload. Subsection lock payload
lifetimeAndGarbageCollection = subsection
  { title: "Lifetime and garbage collection"
  , matter: pure
      [ D.p_
          [ text_ "This subsection will be about "
          , D.span (D.Class !:= "font-bold")
              [ text_ "Lifetime and garbage collection" ]
          , text_ "."
          ]
      ]
  }
