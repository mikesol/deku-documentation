module Pages.CoreConcepts.Effects.Hydration.InjectingDependencies where

import Prelude


import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

injectingDependencies :: forall lock payload. Subsection lock payload
injectingDependencies = subsection
  { title: "Injecting dependencies"
  , matter: pure
      [ D.p_
          [ text_ "This subsection will be about "
          , D.span (D.Class !:= "font-bold") [ text_ "Injecting dependencies" ]
          , text_ "."
          ]
      ]
  }
