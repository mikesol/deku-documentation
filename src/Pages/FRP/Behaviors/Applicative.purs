module Pages.FRP.Behaviors.Applicative where

import Contracts (Section, section)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D
import Pages.FRP.Behaviors.Applicative.WhyBehaviorsAreNotMonads (whyBehaviorsAreNotMonads)
import Pages.FRP.Behaviors.Applicative.BehaviorsAsApplicatives (behaviorsAsApplicatives)
import Pages.FRP.Behaviors.Applicative.BehaviorsAsFunctors (behaviorsAsFunctors)

applicative :: forall lock payload. Section lock payload
applicative = section
  { title: "Applicative"
  , topmatter:
      [ D.p_
          [ text_ "This section will be about "
            , D.span (D.Class !:= "font-bold") [ text_ "Applicative"]
            , text_ "."
          ]
      ]
  , subsections:
      [ whyBehaviorsAreNotMonads,behaviorsAsApplicatives,behaviorsAsFunctors]
  }
