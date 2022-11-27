module Pages.AdvancedUsage.CustomElements.UsingIonic where

import Contracts (Section, section)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D
import Pages.AdvancedUsage.CustomElements.UsingIonic.UsingIonicCustomElements (usingIonicCustomElements)
import Pages.AdvancedUsage.CustomElements.UsingIonic.DefiningIonicCustomElements (definingIonicCustomElements)

usingIonic :: forall lock payload. Section lock payload
usingIonic = section
  { title: "UsingIonic"
  , topmatter:
      [ D.p_
          [ text_ "This section will be about "
          , D.span (D.Class !:= "font-bold") [ text_ "UsingIonic" ]
          , text_ "."
          ]
      ]
  , subsections:
      [ usingIonicCustomElements, definingIonicCustomElements ]
  }
