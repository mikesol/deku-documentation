module Pages.CoreConcepts.Effects.Aff.TriggerAffWithCancellation where

import Prelude

import Components.Code (psCodeWithLink)
import Components.ExampleBlockquote (exampleBlockquote)
import Contracts (Subsection, subsection)
import Data.Tuple.Nested ((/\))
import Deku.Attributes (klass_)
import Deku.Control (text, text_)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useAffWithCancellation, useState')
import Deku.Listeners (click_)
import Effect.Class (liftEffect)
import Examples as Examples
import Fetch (Method(..), fetch)

triggerAffWithCancellation
  :: Subsection
triggerAffWithCancellation = subsection
  { title: "The useAffWithCancellation hook"
  , matter: pure
      [ D.p_
          [ text_
              "This variation does cancellation, so when a new aff comes down the pipe, the previous one is cancelled."
          ]
      , psCodeWithLink Examples.UseAffWithCancellationHook
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
                    [ click_ (setClicked unit)
                    , klass_ "cursor-pointer"
                    ]
                    [ text_ "Click for a random http response" ]
                , text_ ": "
                , text (show <$> response)
                ]
          ]
      ]
  }
