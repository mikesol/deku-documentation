module Pages.FRP.Events.InteractiveEvents.TheCreateEffect where

import Prelude

import Components.Code (psCode)
import Contracts (Env(..), Subsection, subsection)
import Deku.Attributes (klass)
import Deku.Control (text)
import Deku.DOM as D
import Deku.Listeners (click)
import Effect.Console (log)
import FRP.Event (create, subscribe)
import Router.ADT (Route(..))

buttonClass =
  """inline-flex items-center rounded-md
border border-transparent bg-indigo-600 px-3 py-2
text-sm font-medium leading-4 text-white shadow-sm
hover:bg-indigo-700 focus:outline-none focus:ring-2
focus:ring-indigo-500 focus:ring-offset-2 mr-6""" :: String

theCreateEffect :: Subsection
theCreateEffect = subsection
  { title: "The create effect"
  , matter: \(Env { routeLink }) ->
      [ D.p_
          [ text "Similar to "
          , routeLink State
          , text
              " hooks from Deku, we can create a pusher and an event with the "
          , D.b__ "create"
          , text " effect. It has the following signature:"
          ]
      , psCode
          """create
  :: forall a
  . Effect
    { event :: Event a
    , push :: a -> Effect Unit
    }"""
      , D.p_
          [ text "Let's write a small program using "
          , D.code__ "create"
          , text
              ". Our program will use the created event to write a message to the console. When clicking on "
          , D.b__ "Run program"
          , text " below, make sure to open up the console to see the result!"
          ]
      , psCode
          """main = do
  { push, event } <- create
  u <- subscribe event log
  push "fee"
  push "fi"
  push "fo"
  u
  push "fum" """
      , D.button
          [ klass buttonClass
          , click do
              { push, event } <- create
              u <- subscribe event log
              push "fee"
              push "fi"
              push "fo"
              u
              push "fum"
          ]
          [ text "Run program" ]
      , D.p_
          [ text
              "Note how, when you run the program, the word \"fum\" does not print to the console. This is because the unsubscriber is called before \"fum\" is pushed to the event."
          ]
      , D.p_
          [ text "In Deku, the state hooks are literally just calling "
          , D.code__ "create"
          , text
              " under the hood and passing those down into a DSL representing the DOM. And we have the guile to call those two lines of code a framework... 😤"
          ]
      ]
  }
