module Examples.MultipleSubscriptions where

import Prelude

import Data.Array (replicate)
import Data.Number.Format (fixed, toStringWith)
import Data.Tuple.Nested ((/\))
import Deku.Control (text)
import Deku.DOM as D
import Deku.DOM.Attributes as DA
import Deku.DOM.Listeners as DL
import Deku.Do as Deku
import Deku.Hooks (useState, guard)
import Deku.Toplevel (runInBody)
import Effect (Effect)
import ExampleAssitant (ExampleSignature)
import FRP.Event.Random (withRandom)
import FRP.Event.Time (interval')
import FRP.Poll (sham)

app :: ExampleSignature
app runExample = do
  randos <- interval' withRandom 250
  let quit = randos.unsubscribe
  append <$> pure quit <*> runExample Deku.do
    setOnOff /\ onOff <- useState false
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
                  ( (D.div_ <<< pure <<< text) $ sham
                      ( randos.event <#> _.random >>>
                          toStringWith (fixed 2)
                      )
                  )
              )
          ]
      ]

main :: Effect Unit
main = void $ app runInBody