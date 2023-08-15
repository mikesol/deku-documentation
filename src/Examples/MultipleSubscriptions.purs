module Examples.MultipleSubscriptions where

import Deku.Toplevel (runInBody')
import Effect (Effect)
import Prelude
import ExampleAssitant (ExampleSignature)

import Data.Array (replicate)
import Data.Number.Format (fixed, toStringWith)
import Data.Tuple (Tuple(..))
import Data.Tuple.Nested ((/\))
import Deku.Attributes (klass, klass_)
import Deku.Control (text, text_)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useState, guard)
import Deku.Listeners (click, click_)

import Effect.Random (random)
import FRP.Poll (poll, sample_)
import FRP.Event.Time (interval)

app :: ExampleSignature
app runExample = do
  i <- interval 250
  runExample Deku.do
    setOnOff /\ onOff <- useState false
    let e = sample_ (poll (pure (Tuple (pure unit) random))) i.event
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

main :: Effect Unit
main = void $ app (map (map void) runInBody')