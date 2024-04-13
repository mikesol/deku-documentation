module Examples.PollsVersusFlapping where

import Prelude

import Deku.Control (text)
import Deku.DOM as D
import Deku.Toplevel (runInBody)
import Effect (Effect)
import Effect.Random (random)
import ExampleAssitant (ExampleSignature)
import FRP.Event (bindToEffect)
import FRP.Event.Time (interval)
import FRP.Poll (poll, sample, sham)

app :: ExampleSignature
app runExample = do
  i <- interval 250
  let quit = i.unsubscribe
  append <$> pure quit <*> runExample do
    D.div_
      [ D.p_
          [ text
              ( sham $ show <$> sample
                  (poll (\e -> bindToEffect e (_ <$> random)))
                  (i.event $> add 42.0)
              )
          ]
      , D.p_
          [ text
              ( sham $ show <$> ((i.event $> add 42.0) <@> 3.1416)
              )
          ]
      ]

main :: Effect Unit
main = void $ app $ map pure runInBody