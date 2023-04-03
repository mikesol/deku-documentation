module Pages.FRP.Events.Definition.SubscriptionAndUnsubscriptionEffects where

import Prelude

import Components.Code (psCode, psCodeWithLink)
import Contracts (Subsection, subsection)
import Deku.Attribute ((!:=))
import Deku.Attributes (klass_)
import Deku.Control (text_)
import Deku.DOM as D
import Effect (Effect)
import Effect.Random (random)
import Effect.Ref (new, read, write)
import Effect.Timer (clearInterval, setInterval)
import Examples as Examples
import QualifiedDo.Alt as Alt
import Web.DOM.Document (createElement, createTextNode)
import Web.DOM.Element (setAttribute, toEventTarget, toNode)
import Web.DOM.Node (appendChild, setTextContent)
import Web.DOM.Text as TN
import Web.Event.Event (EventType(..))
import Web.Event.EventTarget (addEventListener, eventListener)
import Web.HTML (window)
import Web.HTML.HTMLDocument (toDocument)
import Web.HTML.HTMLDocument (toDocument)
import Web.HTML.Window (document)

type Event a = (a -> Effect Unit) -> Effect (Effect Unit)

subscriptionAndUnsubscriptionEffects
  :: Subsection
subscriptionAndUnsubscriptionEffects = subsection
  { title: "Subscription and unsubscription effects"
  , matter: pure
      [ D.p_
          [ text_
              "To get a better sense of how these subscription and unsubscription effects work in practice, let's create a small PureScript program that uses an event to update the DOM. The program uses the raw DOM API without any frameworks. In doing so, we'll see how the event contract plays out step by step."
          ]
      , psCodeWithLink Examples.HandRolledEvent
      , D.blockquote
          Alt.do
            klass_ "not-italic"
            D.Self !:= \bod -> do
              doc <- window >>= document <#> toDocument
              anchor <- createElement "a" doc
              setAttribute "class" "cursor-pointer" anchor
              setTextContent "Turn on event" (toNode anchor)
              txt <- createTextNode " " doc
              div <- createElement "div" doc
              setAttribute "style" "hidden" div
              appendChild (toNode anchor) (toNode bod)
              appendChild (TN.toNode txt) (toNode bod)
              appendChild (toNode div) (toNode bod)
              onOff <- new false
              unsubscribe <- new (pure unit)
              let
                (event :: Event Number) = \callback -> do
                  random >>= callback
                  i <- setInterval 400 do
                    random >>= callback
                  pure do
                    clearInterval i
              el <- eventListener \_ -> do
                read onOff >>= case _ of
                  false -> do
                    u <- event \v -> setTextContent (show v) (toNode div)
                    write u unsubscribe
                    write true onOff
                    setTextContent "Turn off event" (toNode anchor)
                  true -> do
                    u <- read unsubscribe
                    u
                    write false onOff
                    setTextContent "Turn on event" (toNode anchor)
              addEventListener (EventType "click") el true
                (toEventTarget anchor)
          []
      , D.p__
          "First, let's zoom in on the hand-rolled event that's doing the updating"
      , psCode
          """let
  (event :: Event Number) = \callback -> do
    random >>= callback
    i <- setInterval 400 do
      random >>= callback
    pure do
      clearInterval i"""
      , D.p_
          [ text_
              "Let's convince ourselves that this event fulfills the contract "
          , D.code__ "(a -> Effect Unit) -> Effect (Effect Unit)"
          , text_ ". The argument "
          , D.code__ "callback"
          , text_ " is our "
          , D.code__ "(a -> Effect Unit)"
          , text_
              ", so let's verify that it has that type. Indeed it does, as it binds to "
          , D.code__ "random"
          , text_ ". Next, let's see if the return type is "
          , D.code__ "Effect (Effect Unit)"
          , text_
              ". Indeed it is, as the return type is a thunk that clears the interval, which seems like a sensible unsubscribe action."
          ]
      , D.p_
          [ text_
              "So now that we've validated that our event conforms to the contract of "
          , D.code__ "Event"
          , text_
              " the next step is looking at what subscription and unsubscription look like. We subscribe like so:"
          ]
      , psCode
          """u <- event \v -> setTextContent (show v) (toNode div)
write u unsubscribe"""
      , D.p_
          [ text_
              "We pass the event a subscriber that takes a float and writes it to a "
          , D.code__ "div"
          , text_ ". "
          , D.i__ "This is our callback"
          , text_
              "! It's challenging to follow the control flow because it is not linear, but read through the code bloc again and convince yourself that this function "
          , D.i__ "is"
          , text_ " the callback in the defintion of "
          , D.code__ "Event"
          , text_ " and therefore "
          , D.i__ "is"
          , text_ " the function that receives the output of "
          , D.code__ "random"
          , text_ "."
          ]
      , D.p_ [ text_ "Next up is our unsubscribe." ]
      , psCode
          """u <- read unsubscribe
u"""
      , D.p_
          [ text_
              "We read a reference to the unsubscribe function we set when we subscribed to the listener and thunk it. Again, convince yourself that this unsubscribe function is none other than:"
          ]
      , psCode
          """pure do
  clearInterval i"""
      , D.p_
          [ text_
              "Which is why our random number emitting stops emitting when we ask it to. Pretty neat, huh?"
          ]
      , D.p_
          [ text_
              "You may be wondering: Why have such a backwards control flow just to update stuff in the DOM? Good question! The reason is because, as we'll learn in the following sections, "
          , D.code__ "Event"
          , text_
              " can now act as a killer abstraction for which we will define all sorts of typeclass instances and functions to supercharge our application writing while benefiting from the fast performance of this example."
          ]
      ]
  }
