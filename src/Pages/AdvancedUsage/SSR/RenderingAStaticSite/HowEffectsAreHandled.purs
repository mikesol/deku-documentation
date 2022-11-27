module Pages.AdvancedUsage.SSR.RenderingAStaticSite.HowEffectsAreHandled where

import Prelude

import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

howEffectsAreHandled :: forall lock payload. Subsection lock payload
howEffectsAreHandled = subsection
  { title: "How effects are handled"
  , matter: pure
      [ D.p_
          [ text_ "This subsection will be about "
          , D.span (D.Class !:= "font-bold") [ text_ "How effects are handled" ]
          , text_ "."
          ]
      ]
  }
