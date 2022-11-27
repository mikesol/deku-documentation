module Pages.AdvancedUsage.SSR.RenderingAStaticSite.TheToplevelElement where

import Prelude


import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

theToplevelElement :: forall lock payload. Subsection lock payload
theToplevelElement = subsection
  { title: "The toplevel element"
  , matter: pure
      [ D.p_
          [ text_ "This subsection will be about "
          , D.span (D.Class !:= "font-bold") [ text_ "The toplevel element" ]
          , text_ "."
          ]
      ]
  }
