module Pages.FRP.Events.Definition where

import Prelude

import Contracts (Section, section)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D
import Pages.FRP.Events.Definition.SubscriptionAndUnsubscriptionEffects (subscriptionAndUnsubscriptionEffects)
import Pages.FRP.Events.Definition.TheTypeAndContract (theTypeAndContract)
import Pages.FRP.Events.Definition.ContuationPassingStyle (contuationPassingStyle)

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
      [ theTypeAndContract
      , subscriptionAndUnsubscriptionEffects
      , contuationPassingStyle
      ]
  }
