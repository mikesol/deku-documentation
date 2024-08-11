module Pages.FRP.Events where

import Prelude

import Components.Code (psCode)
import Contracts (Page, page)
import Deku.DOM.Attributes as DA
import Deku.Control (text_)
import Deku.DOM as D
import Pages.FRP.Events.Definition (definition)
import Pages.FRP.Events.InteractiveEvents (interactiveEvents)
import Pages.FRP.Events.StandAloneEvents (standAloneEvents)
import Router.ADT (Route(..))

events :: Page
events = page
  { route: Events
  , topmatter: pure
      [ D.p [ DA.klass_ "lead" ]
          [ text_ "The original FRP type. Always imitated, never duplicated.*"
          ]
      , D.p [ DA.klass_ "text-sm" ]
          [ text_
              "* Haha, get it? Because it's referentially transparent, you can't duplicate an"
          , D.code__ "Event"
          , text_
              ". Oh man that's lame…"
          ]
      , D.p_
          [ text_
              "If you've been following these docs from the beginning, you've been working with events for several pages already. Every time you used a state hook, you created a "
          , D.code__ "Poll"
          , text_ " as well as a pusher to that "
          , D.code__ "Poll."
          ]
      , psCode
          """Deku.do
  pusher /\ event <- useState 42"""
      , D.p_
          [ text_ "As we’ll see later, the "
          , D.code__ "Poll"
          , text_
              " type is defined in terms of events. You have to understand the Tao of "
          , D.code__ "Event"
          , text_ " before you understand the Te of "
          , D.code__ "Poll"
          , text_ "."
          ]
      , D.p_
          [ text_
              "In this section, we’ll look at the "
          , D.code__ "Event"
          , text_
              " type constructor and study its strengths and limitations. Armed with that knowledge, you’ll be able to create truly reactive sites for the ages!"
          ]
      ]
  , sections:
      [ definition
      , interactiveEvents
      , standAloneEvents
      ]
  }
