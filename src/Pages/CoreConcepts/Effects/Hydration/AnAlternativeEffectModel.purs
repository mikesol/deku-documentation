module Pages.CoreConcepts.Effects.Hydration.AnAlternativeEffectModel where

import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

anAlternativeEffectModel :: forall lock payload. Subsection lock payload
anAlternativeEffectModel = subsection
  { title: "An alternative effect model"
  , matter:
      [ D.p_
          [ text_ "This subsection will be about "
          , D.span (D.Class !:= "font-bold")
              [ text_ "An alternative effect model" ]
          , text_ "."
          ]
      ]
  }
