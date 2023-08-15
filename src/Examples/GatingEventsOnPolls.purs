module Examples.GatingEventsOnPolls where

import Deku.Toplevel (runInBody')
import Effect (Effect)
import Prelude
import ExampleAssitant (ExampleSignature)

import Control.Alt ((<|>))
import Data.DateTime.Instant (unInstant)
import Data.Newtype (unwrap)
import Data.Number ((%))
import Deku.Attributes (klass, klass_)
import Deku.Control (text, text_)
import Deku.DOM as D

import FRP.Poll (gateBy)
import FRP.Poll.Time (instant)
import FRP.Event.Time (interval)

app :: ExampleSignature
app runExample = do
  i0 <- interval 200
  i1 <- interval 165
  runExample do
    D.div
      [ klass
          ( gateBy
              (\t _ -> (unwrap $ unInstant t) % 4000.0 < 2000.0)
              instant
              ( (i0.event $> "bg-pink-300") <|>
                  (i1.event $> "bg-green-300")
              )
          )
      ]
      [ text_ "Par-tay!" ]

main :: Effect Unit
main = void $ app (map (map void) runInBody')