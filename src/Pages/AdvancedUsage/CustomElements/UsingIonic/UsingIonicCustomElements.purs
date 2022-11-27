module Pages.AdvancedUsage.CustomElements.UsingIonic.UsingIonicCustomElements where

import Prelude


import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

usingIonicCustomElements :: forall lock payload. Subsection lock payload
usingIonicCustomElements = subsection
  { title: "Using ionic custom elements"
  , matter: pure
      [ D.p_
          [ text_ "This subsection will be about "
          , D.span (D.Class !:= "font-bold")
              [ text_ "Using ionic custom elements" ]
          , text_ "."
          ]
      ]
  }
