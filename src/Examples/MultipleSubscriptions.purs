module Examples.MultipleSubscriptions where

import Prelude

import Data.Array (replicate)
import Data.Number.Format (fixed, toStringWith)
import Data.Tuple.Nested ((/\))
import Deku.DOM.Attributes as DA
import Deku.Control (text)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useState, guard)
import Deku.DOM.Listeners as DL
import Deku.Toplevel (runInBody)
import Effect (Effect)
import Effect.Random (random)
import ExampleAssitant (ExampleSignature)
import FRP.Event.Time (interval)
import FRP.Poll (effectToPoll, sample_, sham)

app :: ExampleSignature
app runExample = do
  i <- interval 250
  runExample Deku.do
    setOnOff /\ onOff <- useState false
    let e = sham (sample_ (effectToPoll random) i.event)
    D.div_
      [ D.a
          [ DL.runOn DL.click $ onOff <#> not >>> setOnOff
          , DA.klass_ "cursor-pointer"
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
main = void $ app $ map pure runInBody