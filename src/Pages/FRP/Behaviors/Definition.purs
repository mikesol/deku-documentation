module Pages.FRP.Behaviors.Definition where

import Prelude

import Contracts (Section, section)
import Deku.Control (text)
import Deku.DOM as D
import Pages.FRP.Behaviors.Definition.TheBehaviorType (theBehaviorType)
import Pages.FRP.Behaviors.Definition.BehaviorsVersusFlapping (behaviorsVersusFlapping)

definition :: Section
definition = section
  { title: "Definition"
  , topmatter: pure
      [ D.p_
          [ text
              "This section will look at how behaviors are defined, explore the nuance of the definition, and present a small example of a Behavior being used in the browser."
          ]
      ]
  , subsections:
      [ theBehaviorType, behaviorsVersusFlapping {-, behaviorsAndYoneda-} ]
  }
