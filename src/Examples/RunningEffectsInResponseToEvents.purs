module Examples.RunningEffectsInResponseToEvents where

import Prelude
import ExampleAssitant (ExampleSignature)

import Data.JSDate (getTime, now)
import Data.Tuple.Nested ((/\))
import Deku.Attributes (klass)
import Deku.Control (text)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useState')
import Deku.Listeners (click)

main :: ExampleSignature
main runExample = runExample Deku.do
  setCurrentTime /\ currentTime <- useState'
  D.div_
    [ D.a
        [ click (getTime <$> now >>= setCurrentTime)
        , klass "cursor-pointer"
        ]
        [ text "Current timestamp" ]
    , text ": "
    , text (show <$> currentTime)
    ]
