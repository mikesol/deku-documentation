module Examples.TheOneOfFunction where

import Prelude

import Data.Array (zipWith)
import Data.Foldable (oneOf, sequence_)
import Deku.Control (text)
import Deku.Toplevel (runInBody)
import Effect (Effect)
import ExampleAssitant (ExampleSignature)
import FRP.Event.Time (interval)
import FRP.Poll (sham)

app :: ExampleSignature
app runExample = do
  head <- interval 87
  shoulders <- interval 341
  knees <- interval 985
  toes <- interval 1401
  let hskt = [ head, shoulders, knees, toes ]
  let quit =  sequence_ (_.unsubscribe <$> hskt)
  append <$> pure quit <*> runExample do
    text $ oneOf
      ( zipWith (\e s -> sham $ e.event $> s) hskt
          [ "head", "shoulders", "knees", "toes" ]
      )

main :: Effect Unit
main = void $ app runInBody
