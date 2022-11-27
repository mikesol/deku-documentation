module Pages.AdvancedUsage.CustomElements.DefiningCustomElements.TheUnsafeCustomElementFunction where

import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

theUnsafeCustomElementFunction :: forall lock payload. Subsection lock payload
theUnsafeCustomElementFunction = subsection
  { title: "The unsafeCustomElement function"
  , matter:
      [ D.p_
          [ text_ "This subsection will be about "
          , D.span (D.Class !:= "font-bold")
              [ text_ "The unsafeCustomElement function" ]
          , text_ "."
          ]
      ]
  }
