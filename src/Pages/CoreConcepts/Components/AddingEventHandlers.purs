module Pages.CoreConcepts.Components.AddingEventHandlers where

import Contracts (Section, section)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D
import Pages.CoreConcepts.Components.AddingEventHandlers.UsingTheOriginalEvent (usingTheOriginalEvent)
import Pages.CoreConcepts.Components.AddingEventHandlers.ReturningABoolean (returningABoolean)
import Pages.CoreConcepts.Components.AddingEventHandlers.UsingAnEffect (usingAnEffect)

addingEventHandlers :: forall lock payload. Section lock payload
addingEventHandlers = section
  { title: "AddingEventHandlers"
  , topmatter:
      [ D.p_
          [ text_ "This section will be about "
            , D.span (D.Class !:= "font-bold") [ text_ "AddingEventHandlers"]
            , text_ "."
          ]
      ]
  , subsections:
      [ usingTheOriginalEvent,returningABoolean,usingAnEffect]
  }
