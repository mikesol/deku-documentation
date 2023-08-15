module Pages.FRP.Events.Definition where

import Prelude

import Contracts (Section, section)
import Deku.Control (text, text_)
import Deku.DOM as D
import Pages.FRP.Events.Definition.SubscriptionAndUnsubscriptionEffects (subscriptionAndUnsubscriptionEffects)
import Pages.FRP.Events.Definition.TheTypeAndContract (theTypeAndContract)

definition :: Section
definition = section
  { title: "Definition"
  , topmatter: pure
      [ D.p_
          [ text_ "Before we start working with the "
          , D.code__ "Event"
          , text
              " type constructor, let's delve into the canonical definition of "
          , D.code__ "Event"
          , text_ "."
          ]
      ]
  , subsections:
      [ theTypeAndContract
      , subscriptionAndUnsubscriptionEffects
      -- , contuationPassingStyle
      ]
  }
