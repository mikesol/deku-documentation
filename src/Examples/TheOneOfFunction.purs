module Examples.TheOneOfFunction where

import Deku.Toplevel (runInBody)
import Prelude
import ExampleAssitant (ExampleSignature)

import Data.Either (hush)
import Data.Foldable (oneOf)
import Data.NonEmpty ((:|))
import Data.Tuple (snd)
import Deku.Control (text)

import FRP.Event (delay, filterMap)
import FRP.Event.Time (interval)

main :: ExampleSignature
main runExample = do
  let
    ms = 967
    loop = 16 * ms
  ivl <- interval loop
  let
    beat w t = filterMap (hush >>> map snd)
      $ delay (t * ms) (ivl.event $> w)
  runExample do
    text $ "Work it" :| oneOf
      [ beat "Work it" 0
      , beat "Make it" 1
      , beat "Do it" 2
      , beat "Makes us" 3
      , beat "Harder" 8
      , beat "Better" 9
      , beat "Faster" 10
      , beat "Stronger" 11
      ]
