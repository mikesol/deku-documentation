module Examples.TheOneOfFunction where

import Prelude

import Control.Alt ((<|>))
import Data.Either (hush)
import Data.Foldable (oneOf)
import Data.Tuple (snd)
import Deku.Control (text)
import Deku.Toplevel (runInBody)
import Effect (Effect)
import ExampleAssitant (ExampleSignature)
import FRP.Event (delay, filterMap)
import FRP.Event.Time (interval)
import FRP.Poll (dredge, sham)

app :: ExampleSignature
app runExample = do
  let
    ms = 967
    loop = 16 * ms
  ivl <- interval loop
  let
    beat w t = filterMap (hush >>> map snd)
      $ dredge (delay (t * ms)) (pure w <|> sham (ivl.event $> w))
  runExample do
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

main :: Effect Unit
main = void $ app $ map pure runInBody