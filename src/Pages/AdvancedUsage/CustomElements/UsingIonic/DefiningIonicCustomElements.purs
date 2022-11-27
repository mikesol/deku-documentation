module Pages.AdvancedUsage.CustomElements.UsingIonic.DefiningIonicCustomElements where

import Prelude

import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

definingIonicCustomElements :: forall lock payload. Subsection lock payload
definingIonicCustomElements = subsection
  { title: "Defining ionic custom elements"
  , matter: pure
      [ D.p_
          [ text_ "This subsection will be about "
          , D.span (D.Class !:= "font-bold")
              [ text_ "Defining ionic custom elements" ]
          , text_ "."
          ]
      ]
  }
