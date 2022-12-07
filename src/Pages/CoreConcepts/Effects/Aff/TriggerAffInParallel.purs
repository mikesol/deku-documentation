module Pages.CoreConcepts.Effects.Aff.TriggerAffInParallel where

import Prelude

import Components.Code (psCode)
import Components.ExampleBlockquote (exampleBlockquote)
import Constants (tripleQ)
import Contracts (Subsection, subsection)
import Contracts (Subsection, subsection)
import Data.Int (floor)
import Data.JSDate (getTime, now)
import Data.Tuple.Nested ((/\))
import Deku.Attribute ((!:=))
import Deku.Attribute ((!:=))
import Deku.Attributes (klass_)
import Deku.Control (blank, text, text_, (<#~>))
import Deku.Control (text_)
import Deku.DOM as D
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useState, useState')
import Deku.Listeners (click, click_)
import Deku.Pursx ((~~))
import Effect.Aff (Milliseconds(..), delay, launchAff, launchAff_)
import Effect.Class (liftEffect)
import Effect.Random (random)
import FRP.Event.Aff (bindToAff, bindToAffParallel)
import FRP.Event.Effect (bindToEffect)
import Fetch (Method(..), fetch)
import QualifiedDo.Alt as Alt
import Type.Proxy (Proxy(..))

triggerAffInParallel :: forall lock payload. Subsection lock payload
triggerAffInParallel = subsection
  { title: "The bindToAffParallel function"
  , matter: pure
      [ D.p_
          [ text_
              "Use this method to bind affs to all events without preserving order. This will keep your UI snappier but things may arrive out of order!"
          ]
      , psCode
          ( """Deku.do
  setThunk /\ thunk <- useState'
  D.div_
    [ D.a
        Alt.do
          click_ (setThunk unit)
          klass_ "cursor-pointer"
        [ text_ "Current timestamp" ]
    , text_ ": "
    , text
        ( show <$> bindToAffParallel thunk
            ( const do
                { text } <- fetch "https://httpbin.org/post"
                  { method: POST
                  , body: """ <> tripleQ
              <>
                """
          { "hello": "world" }
          """
              <> tripleQ
              <>
                """
                  , headers: { "Content-Type": "application/json" }
                  }
                show <$> text
            )
        )
    ]"""
          )
      , exampleBlockquote
          [ Deku.do
              setThunk /\ thunk <- useState'
              D.div_
                [ D.a
                    Alt.do
                      click_ (setThunk unit)
                      klass_ "cursor-pointer"
                    [ text_ "Click for a random http response" ]
                , text_ ": "
                , text
                    ( show <$> bindToAffParallel thunk
                        ( const do
                            { text } <- fetch "https://httpbin.org/post"
                              { method: POST
                              , body: """{"hello":"world"}"""
                              , headers: { "Content-Type": "application/json" }
                              }
                            text
                        )
                    )
                ]
          ]
      ]
  }
