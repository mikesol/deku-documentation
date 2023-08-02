module Examples.RunningEffectsInResponseToEvents where

import Prelude

import Data.JSDate (getTime, now)
import Data.Tuple.Nested ((/\))
import Deku.Attributes (klass)
import Deku.Control (text)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useState')
import Deku.Listeners (click)
import Deku.Toplevel (runInBody)
import Effect (Effect)

main :: Effect Unit
main = runInBody Deku.do
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
