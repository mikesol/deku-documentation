module Examples.RunningAffsSequentiallyInResponseToAnEvent where

import Deku.Toplevel (runInBody')
import Effect (Effect)
import Prelude
import ExampleAssitant (ExampleSignature)

import Data.Tuple.Nested ((/\))
import Deku.Attributes (klass)
import Deku.Control (text)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useState, useState')
import Deku.Listeners (click)

import Effect.Aff (joinFiber, launchAff, try)
import Effect.Class (liftEffect)
import Fetch (Method(..), fetch)

app :: ExampleSignature
app runExample = runExample Deku.do
  setResponse /\ response <- useState'
  setFiber /\ fiber <- useState (pure unit)
  D.div_
    [ D.a
        [ click $ fiber <#> \f -> setFiber =<< launchAff do
            _ <- try $ joinFiber f
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

main :: Effect Unit
main = void $ app (map (map void) runInBody')