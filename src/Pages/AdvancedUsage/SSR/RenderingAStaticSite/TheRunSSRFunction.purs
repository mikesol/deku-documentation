module Pages.AdvancedUsage.SSR.RenderingAStaticSite.TheRunSSRFunction where

import Prelude


import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

theRunSSRFunction :: forall lock payload. Subsection lock payload
theRunSSRFunction = subsection
  { title: "The runSSR function"
  , matter: pure
      [ D.p_
          [ text_ "This subsection will be about "
          , D.span (D.Class !:= "font-bold") [ text_ "The runSSR function" ]
          , text_ "."
          ]
      ]
  }
