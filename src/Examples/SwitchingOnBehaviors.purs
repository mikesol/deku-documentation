module Examples.SwitchingOnBehaviors where

import Deku.Toplevel (runInBody')
import Effect (Effect)
import Prelude
import ExampleAssitant (ExampleSignature)

import Data.DateTime.Instant (unInstant)
import Data.Newtype (unwrap)
import Data.Number ((%))
import Data.Tuple (Tuple(..))
import Deku.Control (text)

import Effect.Random (random)
import FRP.Behavior (behavior, sample_, switcher)
import FRP.Event.Time (interval)

app :: ExampleSignature
app runExample = do
  i0 <- interval 250
  i1 <- interval 2000
  runExample do
    let
      b i = behavior
        $ pure (Tuple (pure unit) (mul i <$> random))
    text
      ( show <$>
          ( sample_
              ( switcher (b 1.0)
                  ( i1.event <#> \i -> b
                      (((unwrap $ unInstant i) / 1000.0) % 1.0)
                  )
              )
              i0.event
          )
      )

main :: Effect Unit
main = void $ app (map (map void) runInBody')