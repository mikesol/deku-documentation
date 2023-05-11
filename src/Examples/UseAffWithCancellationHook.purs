module Examples.UseAffHookWithCancellationHook where

import Prelude

import Data.Tuple.Nested ((/\))
import Deku.Attributes (klass_)
import Deku.Control (text, text_)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useAffWithCancellation, useState')
import Deku.Listeners (click_)
import Deku.Toplevel (runInBody)
import Effect (Effect)
import Effect.Class (liftEffect)
import Fetch (Method(..), fetch)

main :: Effect Unit
main = runInBody Deku.do
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
