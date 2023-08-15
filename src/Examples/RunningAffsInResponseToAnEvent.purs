module Examples.RunningAffsInResponseToAnEvent where

import Deku.Toplevel (runInBody')
import Effect (Effect)
import Prelude
import ExampleAssitant (ExampleSignature)

import Data.Tuple.Nested ((/\))
import Deku.Attributes (klass, klass_)
import Deku.Control (text, text_)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useState')
import Deku.Listeners (click, click_)

import Effect.Aff (launchAff_)
import Effect.Class (liftEffect)
import Fetch (Method(..), fetch)

app :: ExampleSignature
app runExample = runExample Deku.do
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
        , klass_ "cursor-pointer"
        ]
        [ text_ "Click for a random http response" ]
    , text_ ": "
    , text (show <$> response)
    ]

main :: Effect Unit
main = void $ app (map (map void) runInBody')