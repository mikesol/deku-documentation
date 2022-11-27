module Pages.CoreConcepts.Effects.Riders.EffectsOnTeardown where

import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

effectsOnTeardown :: forall lock payload. Subsection lock payload
effectsOnTeardown = subsection
  { title: "Effects on teardown"
  , matter:
      [ D.p_
          [ text_ "This subsection will be about "
          , D.span (D.Class !:= "font-bold") [ text_ "Effects on teardown" ]
          , text_ "."
          ]
      ]
  }
