module Examples.RunningAffsWithCancellationInResponseToAnEvent where

import Prelude

import Data.Tuple.Nested ((/\))
import Deku.Attributes (klass)
import Deku.Control (text)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useState, useState')
import Deku.Listeners (click)
import Deku.Toplevel (runInBody)
import Effect (Effect)
import Effect.Aff (error, killFiber, launchAff)
import Effect.Class (liftEffect)
import Fetch (Method(..), fetch)

main :: Effect Unit
main = runInBody Deku.do
  setResponse /\ response <- useState'
  setFiber /\ fiber <- useState (pure unit)
  D.div_
    [ D.a
        [ click $ fiber <#> \f -> setFiber =<< launchAff do
            killFiber (error "Who needed that request?") f
            { text: t } <- fetch "https://httpbin.org/post"
              { method: POST
              , body: """{"hello":"world"}"""
              , headers: { "Content-Type": "application/json" }
              }
            t' <- t
            liftEffect $ setResponse t'

        , klass "cursor-pointer"
        ]
        [ text "Click for a random http response" ]
    , text ": "
    , text (show <$> response)
    ]
