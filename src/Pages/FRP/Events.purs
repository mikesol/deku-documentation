module Pages.FRP.Events where

import Prelude

import Components.Code (psCode)
import Contracts (Page, page)
import Deku.Attribute ((:=), (<:=>), (!:=))
import Deku.Control (text, text_)
import Deku.DOM as D
import Pages.FRP.Events.Definition (definition)
import Pages.FRP.Events.InteractiveEvents (interactiveEvents)
import Pages.FRP.Events.StandAloneEvents (standAloneEvents)
import Router.ADT (Route(..))

events :: Page
events = page
  { route: Events
  , topmatter: pure
      [ D.p [D.Class !:= "lead"]
          [ text_ "The original FRP type. Always imitated, never duplicated."
          ]
      , D.p_
          [ text_
              "If you've been following these docs from the beginning, you've been working with events for several pages already. Every time you used a state hook, you created an event as well as a pusher to that event."
          ]
      , psCode
          """Deku.do
  pusher /\ event <- useState 42"""
      , D.p_
          [ text_
              "We've also seen that events can be mapped over, which is how we turned their raw data into assets like text and attributes."
          ]
      , D.p_
          [ text_
              " To create robust web apps with Deku, however, it's important to go to the heart of the "
          , D.code__ "Event"
          , text_
              " type constructor and understand its strengths and limitations. Armed with that knowledge, you'll be able to create truly reactive sites for the ages!"
          ]
      ]
  , sections:
      [ definition
      , interactiveEvents
      , standAloneEvents
      ]
  }
