module Pages.FRP.Events.StandAloneEvents.MultipleSubscriptions where

import Prelude

import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

multipleSubscriptions :: forall lock payload. Subsection lock payload
multipleSubscriptions = subsection
  { title: "Multiple subscriptions"
  , matter: pure
      [ D.p_
          [ text_ "Unlike the event created by "
          , D.code__ "create"
          , text_ ", each subscription to an event created by "
          , D.code__ "makeEvent"
          , text_ " results in a new effect chain being run on "
          , D.i__ "each"
          , text_
              " subscription. To illustrate this, let's create a small app with five subscriptions to the same "
          , D.code__ "setInterval"
          , text_
              " event. Even though the event is the same, each subscription will trigger a "
          , D.i__ "different"
          , text_ " side effect, which will cause the five results to diverge."
          ]
      ]
  }
