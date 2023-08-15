module Pages.FRP.Events.InteractiveEvents.TheCreateEffect where

import Prelude

import Components.Code (psCode)
import Contracts (Env(..), Subsection, getEnv, subsection)
import Control.Monad.ST.Class (liftST)
import Deku.Attributes (klass, klass_)
import Deku.Control (text, text_)
import Deku.DOM as D
import Deku.Listeners (click, click_)
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
  , matter: do
      Env { routeLink } <- getEnv
      pure
        [ D.p_
            [ text_ "Similar to "
            , routeLink State
            , text
                " hooks from Deku, we can create a pusher and an event with the "
            , D.b__ "create"
            , text_ " effect. It has the following signature:"
            ]
        , psCode
            """create
  :: forall a
  . ST Global
    { event :: Event a
    , push :: a -> Effect Unit
    }"""
        , D.p_
            [ text_ "Let's write a small program using "
            , D.code__ "create"
            , text
                ". Our program will use the created event to write a message to the console. When clicking on "
            , D.b__ "Run program"
            , text_ " below, make sure to open up the console to see the result!"
            ]
        , psCode
            """main = do
  { push, event } <- liftST create
  u <- liftST $ subscribe event log
  push "fee"
  push "fi"
  push "fo"
  liftST u
  push "fum" """
        , D.button
            [ klass_ buttonClass
            , click do
                { push, event } <- liftST create
                u <- liftST $ subscribe event log
                push "fee"
                push "fi"
                push "fo"
                liftST u
                push "fum"
            ]
            [ text_ "Run program" ]
        , D.p_
            [ text
                "Note how, when you run the program, the word \"fum\" does not print to the console. This is because the unsubscriber is called before \"fum\" is pushed to the event."
            ]
        , D.p_
            [ text_ "In Deku, the state hooks are literally just calling "
            , D.code__ "create"
            , text
                " under the hood and passing those down into a DSL representing the DOM. And we have the guile to call those two lines of code a framework... 😤"
            ]
        ]
  }
