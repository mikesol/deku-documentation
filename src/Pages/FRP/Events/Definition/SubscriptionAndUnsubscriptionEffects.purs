module Pages.FRP.Events.Definition.SubscriptionAndUnsubscriptionEffects where

import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

subscriptionAndUnsubscriptionEffects
  :: forall lock payload. Subsection lock payload
subscriptionAndUnsubscriptionEffects = subsection
  { title: "Subscription and unsubscription effects"
  , matter:
      [ D.p_
          [ text_ "This subsection will be about "
          , D.span (D.Class !:= "font-bold")
              [ text_ "Subscription and unsubscription effects" ]
          , text_ "."
          ]
      ]
  }
