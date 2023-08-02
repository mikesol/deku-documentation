module Pages.CoreConcepts.Effects.Aff.TriggerAffWithCancellation where

import Prelude

import Components.Code (psCodeWithLink)
import Components.ExampleBlockquote (exampleBlockquote)
import Contracts (Subsection, subsection)
import Data.Tuple.Nested ((/\))
import Deku.Attributes (klass)
import Deku.Control (text)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useAffWithCancellation, useState')
import Deku.Listeners (click)
import Effect.Class (liftEffect)
import Examples as Examples
import Fetch (Method(..), fetch)

triggerAffWithCancellation
  :: Subsection
triggerAffWithCancellation = subsection
  { title: "The useAffWithCancellation hook"
  , matter: pure
      [ D.p_
          [ text
              "This variation does cancellation, so when a new aff comes down the pipe, the previous one is cancelled."
          ]
      , psCodeWithLink Examples.RunningAffsWithCancellationInResponseToAnEvent
      , exampleBlockquote
          [ Deku.do
              setResponse /\ response <- useState'
              setClicked /\ clicked <- useState'
              useAffWithCancellation clicked \_ -> do
                { text: t } <- fetch "https://httpbin.org/post"
                  { method: POST
                  , body: """{"hello":"world"}"""
                  , headers: { "Content-Type": "application/json" }
                  }
                t >>= liftEffect <<< setResponse
              D.div_
                [ D.a
                    [ click (setClicked unit)
                    , klass "cursor-pointer"
                    ]
                    [ text "Click for a random http response" ]
                , text ": "
                , text (show <$> response)
                ]
          ]
      ]
  }
