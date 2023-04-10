module Examples.MultipleSubscriptions where

import Prelude

import Data.Array (replicate)
import Data.Number.Format (fixed, toStringWith)
import Data.Tuple.Nested ((/\))
import Deku.Attributes (klass_)
import Deku.Control (guard, text)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useState)
import Deku.Listeners (click)
import Deku.Toplevel (runInBody)
import Effect (Effect)
import Effect.Random (random)
import FRP.Event.Effect (bindToEffect)
import FRP.Event.Time (interval)

main :: Effect Unit
main = runInBody Deku.do
  setOnOff /\ onOff <- useState false
  let e = bindToEffect (interval 250) (const random)
  D.div_
    [ D.a
        [ click $ onOff <#> not >>> setOnOff
        , klass_ "cursor-pointer"
        ]
        [ text $ onOff <#> if _ then "Turn me off" else "Turn me on"
        ]
    , guard onOff $ D.div_
        [ D.div__ "The same event, but..."
        , D.div_
            ( replicate 5
                ( (D.div_ <<< pure <<< text) $ e <#> toStringWith
                    (fixed 2)
                )
            )
        ]
    ]