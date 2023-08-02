module Pages.CoreConcepts.Effects.Aff.TriggerAffInParallel where

import Prelude

import Components.Code (psCodeWithLink)
import Components.ExampleBlockquote (exampleBlockquote)
import Contracts (Subsection, subsection)
import Data.Tuple.Nested ((/\))
import Deku.Attributes (klass)
import Deku.Control (text)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useAff, useState')
import Deku.Listeners (click)
import Effect.Class (liftEffect)
import Examples as Examples
import Fetch (Method(..), fetch)

triggerAffInParallel :: Subsection
triggerAffInParallel = subsection
  { title: "The useAff hook"
  , matter: pure
      [ D.p_
          [ text
              "Use this hook to trigger affs without preserving order. This will keep your UI snappier but things may arrive out of order!"
          ]
      , psCodeWithLink Examples.RunningAffsInResponseToAnEvent
      , exampleBlockquote
          [ Deku.do
              setResponse /\ response <- useState'
              setClicked /\ clicked <- useState'
              useAff clicked \_ -> do
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
