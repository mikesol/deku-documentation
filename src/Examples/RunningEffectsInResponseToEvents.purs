module Examples.RunningEffectsInResponseToEvents where

import Prelude

import Data.JSDate (getTime, now)
import Data.Tuple.Nested ((/\))
import Deku.Attributes (klass_)
import Deku.Control (text, text_)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useState')
import Deku.Listeners (click_)
import Deku.Toplevel (runInBody')
import Effect (Effect)
import ExampleAssitant (ExampleSignature)

app :: ExampleSignature
app runExample = runExample Deku.do
  setCurrentTime /\ currentTime <- useState'
  D.div_
    [ D.a
        [ click_ (getTime <$> now >>= setCurrentTime)
        , klass_ "cursor-pointer"
        ]
        [ text_ "Current timestamp" ]
    , text_ ": "
    , text (show <$> currentTime)
    ]

main :: Effect Unit
main = void $ app (map (map void) runInBody')