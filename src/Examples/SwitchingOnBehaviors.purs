module Examples.SwitchingOnBehaviors where

import Prelude

import Data.DateTime.Instant (unInstant)
import Data.Newtype (unwrap)
import Data.Number ((%))
import Deku.Toplevel (runInBody)
import Effect (Effect)
import FRP.Event.Time (interval)
import Deku.Control (text)
import Effect.Random (random)
import FRP.Behavior (behavior, sample_, switcher)
import FRP.Event.Effect (bindToEffect)

main :: Effect Unit
main = runInBody do
  let
    b i = behavior
      (\e -> bindToEffect e \f -> (f <<< mul i) <$> random)
  text
    ( show <$>
        ( sample_
            ( switcher (b 1.0)
                ( interval 2000 <#> \i -> b
                    (((unwrap $ unInstant i) / 1000.0) % 1.0)
                )
            )
            (interval 250)
        )
    )