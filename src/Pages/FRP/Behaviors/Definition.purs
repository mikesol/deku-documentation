module Pages.FRP.Behaviors.Definition where

import Prelude

import Contracts (Section, section)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D
import Pages.FRP.Behaviors.Definition.TheBehaviorType (theBehaviorType)
import Pages.FRP.Behaviors.Definition.BehaviorsVersusFlapping (behaviorsVersusFlapping)
import Pages.FRP.Behaviors.Definition.BehaviorsAndYoneda (behaviorsAndYoneda)

definition :: forall lock payload. Section lock payload
definition = section
  { title: "Definition"
  , topmatter: pure
      [ D.p_
          [ text_ "This section will be about "
          , D.span (D.Class !:= "font-bold") [ text_ "Definition" ]
          , text_ "."
          ]
      ]
  , subsections:
      [ theBehaviorType, behaviorsVersusFlapping, behaviorsAndYoneda ]
  }
