module Examples.PollsVersusFlapping where

import Prelude

import Data.Tuple (Tuple(..))
import Deku.Control (text, text_)
import Deku.DOM as D
import Deku.Toplevel (runInBody')
import Effect (Effect)
import Effect.Random (random)
import ExampleAssitant (ExampleSignature)
import FRP.Poll (poll, sample)
import FRP.Event.Time (interval)

app :: ExampleSignature
app runExample = do
  i <- interval 250
  runExample do
    D.div_
      [ D.p_
          [ text
              ( show <$> sample
                  (poll (pure (Tuple (pure unit) random)))
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