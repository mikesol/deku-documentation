module Examples.RunningAffsInResponseToAnEvent where

import Prelude

import Data.Tuple.Nested ((/\))
import Deku.DOM.Attributes as DA
import Deku.Control (text, text_)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useState')
import Deku.DOM.Listeners as DL
import Deku.Toplevel (runInBody)
import Effect (Effect)
import Effect.Aff (launchAff_)
import Effect.Class (liftEffect)
import ExampleAssitant (ExampleSignature)
import Fetch (Method(..), fetch)

app :: ExampleSignature
app runExample = runExample Deku.do
  setResponse /\ response <- useState'
  D.div_
    [ D.a
        [ DL.click_ \_ -> launchAff_ do
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