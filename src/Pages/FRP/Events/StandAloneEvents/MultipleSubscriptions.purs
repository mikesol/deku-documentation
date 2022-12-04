module Pages.FRP.Events.StandAloneEvents.MultipleSubscriptions where

import Prelude

import Components.Code (psCode)
import Components.ExampleBlockquote (exampleBlockquote)
import Contracts (Subsection, subsection)
import Data.Array (replicate)
import Data.Number.Format (fixed, toStringWith)
import Data.Tuple.Nested ((/\))
import Deku.Attributes (href_, klass_)
import Deku.Control (guard, text, text_)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useMemoized, useState)
import Deku.Listeners (click)
import Effect.Random (random)
import FRP.Event.Effect (bindToEffect)
import FRP.Event.Time (interval)
import QualifiedDo.Alt as Alt

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
      , D.p_
          [ text_ "As an example, let's use "
          , D.code__ "interval"
          , text_ ", from the "
          , D.code__ "purescript-hyrule"
          , text_
              " library that emits an event on a regular interval. Interval is defined like so:"
          ]
      , psCode
          """interval :: Int -> Event Instant
interval n = makeEvent \k -> do
  id <- setInterval n do
    time <- now
    k time
  pure (clearInterval id)"""
      , D.p_
          [ text_ " We'll hook it up to a random number generator via "
          , D.i__ "bindToEffect"
          , text_
              " and use it to fill up five text elements. What do you think will happen?"
          ]
      , psCode
          """module Main where

import Prelude

import Data.Array (replicate)
import Data.Number.Format (fixed, toStringWith)
import Data.Tuple.Nested ((/\))
import Deku.Attributes (klass_)
import Deku.Control (guard, text)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useState)
import Deku.Listeners (click)
import Deku.Toplevel (runInBody)
import Effect (Effect)
import Effect.Random (random)
import FRP.Event.Effect (bindToEffect)
import FRP.Event.Time (interval)
import QualifiedDo.Alt as Alt

main :: Effect Unit
main = runInBody Deku.do
  setOnOff /\ onOff <- useState false
  let e = bindToEffect (interval 250) (const random)
  D.div_
    [ D.a
        Alt.do
          click $ onOff <#> not >>> setOnOff
          klass_ "cursor-pointer"
        [ text $ onOff <#> if _ then "Turn me off" else "Turn me on"
        ]
    , guard onOff $ D.div_
        [ D.div__ "The same event, but..."
        , D.div_
            ( replicate 5
                ( (D.div_ <<< pure <<< text) $ e <#> toStringWith
                    (fixed 2)
                )
            )
        ]
    ]
"""
      , exampleBlockquote
          [ Deku.do
              setOnOff /\ onOff <- useState false
              let e = bindToEffect (interval 250) (const random)
              D.div_
                [ D.a
                    Alt.do
                      click $ onOff <#> not >>> setOnOff
                      klass_ "cursor-pointer"
                    [ text $ onOff <#> if _ then "Turn me off" else "Turn me on"
                    ]
                , guard onOff $ D.div_
                    [ D.div__ "The same event, but..."
                    , D.div_
                        ( replicate 5
                            ( (D.div_ <<< pure <<< text) $ e <#> toStringWith
                                (fixed 2)
                            )
                        )
                    ]
                ]
          ]
      , D.p_
          [ text_
              "Instead of having the same result five times, there are five different results. The results are not only different in their content, but also different in their timing."
          ]
      , D.p_
          [ text_
              "So what's going on? Why does the same event lead to five different behaviors? The reason is because stand-alone events with multiple subscriptions run their effect chain for "
          , D.i__ "each"
          , text_
              " subscription. That is, for each node that subscribes to the random generator, a new interval is created and new random numbers are generated."
          ]
      , D.p_
          [ text_
              "To understand why this is the case, remember back to the section on "
          , D.a (href_ "#subscription-and-unsubscription-effects")
              [ text_ "Subscription adn unsubscription effects" ]
          , text_
              ". We saw that all of the logic ultimately resided in a callback that was activated at subscription and deactivated at unsubscribe. If we wrote out the logic of the example above by hand, we would see the code to create the interval and to hook up the random number generator executed in an "
          , D.code__ "Effect"
          , text_ " context five times."
          ]
      , D.p_
          [ text_ "So if all of this is running in "
          , D.code__ "Effect"
          , text_ ", where's the "
          , D.code__ "Effect"
          , text_ "? All of the side effects are triggered by the "
          , D.code__ "runInBody"
          , text_
              " function, which takes the events in Deku code and subscribes to them. From there, a waterfall of events is unleashed - an entire application's worth!"
          ]
      , D.p__
          "To harmonize both the content and timing, we can use the following version:"
      , psCode
          """module Main where

import Prelude

import Data.Array (replicate)
import Data.Number.Format (fixed, toStringWith)
import Data.Tuple.Nested ((/\))
import Deku.Attributes (klass_)
import Deku.Control (guard, text)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useMemoized, useState)
import Deku.Listeners (click)
import Deku.Toplevel (runInBody)
import Effect (Effect)
import Effect.Random (random)
import FRP.Event.Effect (bindToEffect)
import FRP.Event.Time (interval)
import QualifiedDo.Alt as Alt

main :: Effect Unit
main = runInBody Deku.do
  setOnOff /\ onOff <- useState false
  e <- useMemoized (bindToEffect (interval 250) (const random))
  D.div_
    [ D.a
        Alt.do
          click $ onOff <#> not >>> setOnOff
          klass_ "cursor-pointer"
        [ text $ onOff <#> if _ then "Turn me off" else "Turn me on"
        ]
    , guard onOff $ D.div_
        [ D.div__ "The same event!"
        , D.div_
            ( replicate 5
                ( (D.div_ <<< pure <<< text) $ e <#> toStringWith
                    (fixed 2)
                )
            )
        ]
    ]
"""
      , exampleBlockquote
          [ Deku.do
              setOnOff /\ onOff <- useState false
              e <- useMemoized (bindToEffect (interval 250) (const random))
              D.div_
                [ D.a
                    Alt.do
                      click $ onOff <#> not >>> setOnOff
                      klass_ "cursor-pointer"
                    [ text $ onOff <#> if _ then "Turn me off" else "Turn me on"
                    ]
                , guard onOff $ D.div_
                    [ D.div__ "The same event!"
                    , D.div_
                        ( replicate 5
                            ( (D.div_ <<< pure <<< text) $ e <#> toStringWith
                                (fixed 2)
                            )
                        )
                    ]
                ]
          ]
      , D.p_
          [ text_ "What's happening under the hood with "
          , D.code__ "useMemoized"
          , text_
              " is that a reference to the event's output is being inserted into the effect chain "
          , D.i__ "before"
          , text_
              " the event is subscribed to downstream. Because of that, when the event is subscribed to, each subscription is stored as a reference and then, when a fresh value comes down the pipe, each subscription is looked up and pinged with the new value."
          ]
      ]
  }
