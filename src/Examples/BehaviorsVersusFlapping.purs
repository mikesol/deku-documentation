module Examples.BehaviorsVersusFlapping where

import Prelude

import Data.Tuple (Tuple(..))
import Deku.Control (text)
import Deku.Toplevel (runInBody)
import Effect (Effect)
import Effect.Random (random)
import FRP.Behavior (behavior, sample)
import FRP.Event.Time (interval)

main :: Effect Unit
main = do
  i <- interval 250
  runInBody do
    text
      ( show <$> sample
          (behavior (pure (Tuple (pure unit) random)))
          (i.event $> add 42.0)
      )