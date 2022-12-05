module Scratch where

import Prelude

import Deku.Control (text)
import Deku.Toplevel (runInBody)
import Effect (Effect)
import Data.Functor (mapFlipped)
import Effect.Random (random)
import FRP.Behavior (behavior, sample_)
import FRP.Event.Effect (bindToEffect)
import FRP.Event.Time (interval)

main :: Effect Unit
main = runInBody do
  text
    ( show <$> sample_
        (behavior (flip bindToEffect (mapFlipped random)))
        (interval 250)
    )
