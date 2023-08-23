module Examples.GatingEventsOnPolls where

import Prelude

import Control.Alt ((<|>))
import Data.DateTime.Instant (unInstant)
import Data.Newtype (unwrap)
import Data.Number ((%))
import Deku.DOM.Attributes as DA
import Deku.Control (text_)
import Deku.DOM as D
import Deku.Toplevel (runInBody')
import Effect (Effect)
import ExampleAssitant (ExampleSignature)
import FRP.Event.Time (interval)
import FRP.Poll (gateBy, sham)
import FRP.Poll.Time (instant)

app :: ExampleSignature
app runExample = do
  i0 <- interval 200
  i1 <- interval 165
  let quit = i0.unsubscribe *> i1.unsubscribe
  append <$> pure quit <*> runExample do
    D.div
      [ DA.klass
          ( sham
              ( gateBy
                  (\t _ -> (unwrap $ unInstant t) % 4000.0 < 2000.0)
                  instant
                  ( (i0.event $> "bg-pink-300") <|>
                      (i1.event $> "bg-green-300")
                  )
              )
          )
      ]
      [ text_ "Par-tay!" ]

main :: Effect Unit
main = void $ app (map (map void) runInBody')