module Examples.PurityOutOfThinAir where

import Prelude

import Data.Array (intercalate)
import Deku.Control (text)
import Deku.Toplevel (runInBody)
import Effect (Effect)
import ExampleAssitant (ExampleSignature)
import FRP.Event (fold)
import FRP.Event.Time (interval)
import FRP.Poll (sham)

app :: ExampleSignature
app runExample = do
  i0 <- interval 804
  i1 <- interval 1222
  i2 <- interval 568
  let quit = i0.unsubscribe *> i1.unsubscribe *> i2.unsubscribe
  append <$> pure quit <*> runExample do
    let
      alternate e a b = sham $
        map
          (if _ then a else b)
          (fold (pure <$> not) true e)
    text
      $ intercalate (pure " ")
          [ alternate i0.event "Functional" "Imperative"
          , pure "programming"
          , alternate i1.event "is" "isn't"
          , alternate i2.event "fun!" "boring!"
          ]

main :: Effect Unit
main = void $ app $ map pure runInBody