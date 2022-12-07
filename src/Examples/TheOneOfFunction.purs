module Examples.TheOneOfFunction where

import Prelude

import Control.Alt ((<|>))
import Data.Foldable (oneOf)
import Data.Tuple.Nested ((/\))
import Deku.Control (text)
import Deku.Toplevel (runInBody)
import Effect (Effect)
import FRP.Event (delay)
import FRP.Event.Time (interval)

main :: Effect Unit
main = runInBody do
  let
    ms = 967
    lyrics =
      [ "Work it" /\ 0
      , "Make it" /\ 1
      , "Do it" /\ 2
      , "Makes us" /\ 3
      , "Harder" /\ 8
      , "Better" /\ 9
      , "Faster" /\ 10
      , "Stronger" /\ 11
      ]
    loop = 16 * ms
    beat (w /\ t) =
      delay (t * ms) (pure w <|> (interval loop $> w))
  text (oneOf (beat <$> lyrics))