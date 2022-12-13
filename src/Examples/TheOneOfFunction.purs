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
    loop = 16 * ms
    beat w t = delay (t * ms) (pure w <|> (interval loop $> w))
  text $ oneOf 
    [ beat "Work it" 0
    , beat "Make it" 1
    , beat "Do it" 2
    , beat "Makes us" 3
    , beat "Harder" 8
    , beat "Better" 9
    , beat "Faster" 10
    , beat "Stronger" 11
    ]

