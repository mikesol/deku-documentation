module Pages.CoreConcepts.Components.ASimpleComponent where

import Contracts (Section, section)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D
import Pages.CoreConcepts.Components.ASimpleComponent.WhatsInD (whatsInD)
import Pages.CoreConcepts.Components.ASimpleComponent.AddingText (addingText)
import Pages.CoreConcepts.Components.ASimpleComponent.ArraysAllTheWayDown (arraysAllTheWayDown)

aSimpleComponent :: forall lock payload. Section lock payload
aSimpleComponent = section
  { title: "ASimpleComponent"
  , topmatter:
      [ D.p_
          [ text_ "This section will be about "
          , D.span (D.Class !:= "font-bold") [ text_ "ASimpleComponent" ]
          , text_ "."
          ]
      ]
  , subsections:
      [ whatsInD, addingText, arraysAllTheWayDown ]
  }
