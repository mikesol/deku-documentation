module Examples.RunningAffsSequentiallyInResponseToAnEvent where

import Deku.Toplevel (runInBody)
import Effect (Effect)
import Prelude
import ExampleAssitant (ExampleSignature)

import Data.Tuple.Nested ((/\))
import Deku.DOM.Attributes as DA

import Deku.Control (text, text_)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useState, useState')
import Deku.DOM.Listeners as DL

import Effect.Aff (joinFiber, launchAff, try)
import Effect.Class (liftEffect)
import Fetch (Method(..), fetch)

app :: ExampleSignature
app runExample = runExample Deku.do
  setResponse /\ response <- useState'
  setFiber /\ fiber <- useState (pure unit)
  D.div_
    [ D.a
        [ DL.runOn DL.click $ fiber <#> \f -> setFiber =<< launchAff do
            _ <- try $ joinFiber f
            { text: t } <- fetch "https://httpbin.org/post"
              { method: POST
              , body: """{"hello":"world"}"""
              , headers: { "Content-Type": "application/json" }
              }
            t' <- t
            liftEffect $ setResponse t'

        , DA.klass_ "cursor-pointer"
        ]
        [ text_ "Click for a random http response" ]
    , text_ ": "
    , text (show <$> response)
    ]

main :: Effect Unit
main = void $ app $ map pure runInBody