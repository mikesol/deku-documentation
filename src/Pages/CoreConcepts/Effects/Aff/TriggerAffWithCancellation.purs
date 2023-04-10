module Pages.CoreConcepts.Effects.Aff.TriggerAffWithCancellation where

import Prelude

import Components.Code (psCode)
import Components.ExampleBlockquote (exampleBlockquote)
import Constants (tripleQ)
import Contracts (Subsection, subsection)
import Data.Tuple.Nested ((/\))
import Deku.Attributes (klass_)
import Deku.Control (text, text_)
import Deku.Control (text_)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useState')
import Deku.Listeners (click_)
import FRP.Event.Aff (bindToAffWithCancellation)
import Fetch (Method(..), fetch)

triggerAffWithCancellation
  :: Subsection
triggerAffWithCancellation = subsection
  { title: "The bindToAffWithCancellation function"
  , matter: pure
      [ D.p_
          [ text_
              "This variation does cancellation, so when a new aff comes down the pipe, the previous one is cancelled."
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
        ( show <$> bindToAffWithCancellation thunk
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
                      [click_ (setThunk unit),
                      klass_ "cursor-pointer"]
                    [ text_ "Click for a random http response" ]
                , text_ ": "
                , text
                    ( show <$> bindToAffWithCancellation thunk
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
