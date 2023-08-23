module Examples.SwitchingOnPolls where

import Prelude

import Data.DateTime.Instant (unInstant)
import Data.Newtype (unwrap)
import Data.Number ((%))
import Deku.Control (text)
import Deku.Toplevel (runInBody')
import Effect (Effect)
import Effect.Random (random)
import ExampleAssitant (ExampleSignature)
import FRP.Event (bindToEffect)
import FRP.Event.Time (interval)
import FRP.Poll (poll, sample_, sham, switcher)

app :: ExampleSignature
app runExample = do
  i0 <- interval 250
  i1 <- interval 2000
  runExample.t do
    let
      b i = poll \e -> bindToEffect e \f -> (f <<< mul i) <$> random
    text
      ( show <$> sham
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
main = void $ app { t: map (map void) runInBody' }