module Pages.FRP.Events.PureEvents.TheCreatepureEffect where

import Prelude

import Components.Code (psCode)
import Components.ExampleBlockquote (exampleBlockquote)
import Contracts (Subsection, subsection)
import Control.Monad.ST.Internal (modify, new, read, run)
import Deku.Attribute ((!:=))
import Deku.Control (text_)
import Deku.DOM as D
import FRP.Event (createPure, subscribePure)

theCreatepureEffect :: forall lock payload. Subsection lock payload
theCreatepureEffect = subsection
  { title: "The createPure effect"
  , matter: pure
      [ D.p_
          [ text_ "The "
          , D.code__ "createPure"
          , text_ " is the pure analog to the "
          , D.code__ "create"
          , text_ " effect and is defined like so."
          ]
      , psCode
          """createPure
  :: forall r a
  . ST r
    { event :: Event a
    , push :: a -> ST r Unit
    }"""
      , D.p__
          "It is used to create an event along with a pusher to which you can push values. Because it is interpreted in a pure context, we can use it to create a micro event-based system within our app, run the system, and collect the results without violating any laws of purity, like in the following example."
      , psCode
          """module Main where

import Prelude

import Deku.Toplevel (runInBody)
import Effect (Effect)

import Control.Monad.ST.Internal (modify, new, read, run)
import Deku.Control (text_)
import FRP.Event (createPure, subscribePure)

main :: Effect Unit
main = runInBody do
  text_ $ show $ run do
    { push, event } <- createPure
    rf <- new 0
    _ <- subscribePure event \n -> do
      void $ modify (add 1) rf
    push 48
    push 49
    push 50
    read rf
"""
      , exampleBlockquote
          [ text_ $ show $ run do
              { push, event } <- createPure
              rf <- new 0
              _ <- subscribePure event \n -> do
                void $ modify (add 1) rf
              push 48
              push 49
              push 50
              read rf
          ]
      ]
  }
