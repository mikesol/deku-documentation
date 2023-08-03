module Examples.BehaviorsVersusFlapping where

import Prelude

import Data.Tuple (Tuple(..))
import Deku.Control (text)
import Deku.DOM as D
import Deku.Toplevel (runInBody')
import Effect (Effect)
import Effect.Random (random)
import ExampleAssitant (ExampleSignature)
import FRP.Behavior (behavior, sample)
import FRP.Event.Time (interval)

app :: ExampleSignature
app runExample = do
  i <- interval 250
  runExample do
    D.div_
      [ D.p_
          [ text
              ( show <$> sample
                  (behavior (pure (Tuple (pure unit) random)))
                  (i.event $> add 42.0)
              )
          ]
      , D.p_
          [ text
              ( show <$> ((i.event $> add 42.0) <@> 3.1416)
              )
          ]
      ]

main :: Effect Unit
main = void $ app (map (map void) runInBody')