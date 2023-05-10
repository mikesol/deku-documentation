module Examples.UseEffectHook where

import Prelude

import Data.JSDate (getTime, now)
import Data.Tuple.Nested ((/\))
import Deku.Attributes (klass_)
import Deku.Control (text, text_)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useEffect, useState')
import Deku.Listeners (click_)
import Deku.Toplevel (runInBody)
import Effect (Effect)

main :: Effect Unit
main = runInBody Deku.do
  setCurrentTime /\ currentTime <- useState'
  setClicked /\ clicked <- useState'
  useEffect clicked \_ -> getTime <$> now >>= setCurrentTime
  D.div_
    [ D.a
        [ click_ (setClicked unit)
        , klass_ "cursor-pointer"
        ]
        [ text_ "Current timestamp" ]
    , text_ ": "
    , text (show <$> currentTime)
    ]
