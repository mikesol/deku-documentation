module Pages.CoreConcepts.Effects.LifecycleMethods.EffectsOnInitialization where

import Prelude


import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

effectsOnInitialization :: forall lock payload. Subsection lock payload
effectsOnInitialization = subsection
  { title: "Effects on initialization"
  , matter: pure
      [ D.p_
          [ text_ "This subsection will be about "
          , D.span (D.Class !:= "font-bold")
              [ text_ "Effects on initialization" ]
          , text_ "."
          ]
      ]
  }
