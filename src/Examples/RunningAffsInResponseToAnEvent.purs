module Examples.RunningAffsInResponseToAnEvent where

import Deku.Toplevel (runInBody)
import Prelude
import ExampleAssitant (ExampleSignature)

import Data.Tuple.Nested ((/\))
import Deku.Attributes (klass)
import Deku.Control (text)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useState')
import Deku.Listeners (click)

import Effect.Aff (launchAff_)
import Effect.Class (liftEffect)
import Fetch (Method(..), fetch)

main :: ExampleSignature
main runExample = runExample Deku.do
  setResponse /\ response <- useState'
  D.div_
    [ D.a
        [ click $ launchAff_ do
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
