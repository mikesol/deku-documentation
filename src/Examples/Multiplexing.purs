module Examples.Multiplexing where

import Prelude

import Control.Alt ((<|>))
import Data.Compactable (compact)
import Data.Either (hush)
import Data.Foldable (for_)
import Data.Functor.Contravariant (cmap)
import Data.Op (Op(..))
import Deku.Control (text)
import Deku.Toplevel (runInBody)
import Effect (Effect)
import ExampleAssitant (ExampleSignature)
import FRP.Event.Time (interval', withDelay)
import FRP.Poll (sham)

withMultiplexing :: forall a b. Array (Op (Effect Unit) b -> Op (Effect Unit) a) -> Op (Effect Unit) b -> Op (Effect Unit) a
withMultiplexing l op = Op \a ->
  for_ l \f -> let Op x = f op in x a

app :: ExampleSignature
app runExample = do
  let
    ms = 967
    loop = 16 * ms
    beat w t op = withDelay (t * ms) (cmap (hush >>> (_ $> w)) op)
    beats =
      [ beat "Work it" 0
      , beat "Make it" 1
      , beat "Do it" 2
      , beat "Makes us" 3
      , beat "Harder" 8
      , beat "Better" 9
      , beat "Faster" 10
      , beat "Stronger" 11
      ]
  dj <- interval' (withMultiplexing beats) loop
  let quit = dj.unsubscribe
  append <$> pure quit <*> runExample do
    text $ (pure "Wait for it") <|> sham (compact dj.event)

main :: Effect Unit
main = void $ app $ map pure runInBody