module Examples.GatingEventsOnPolls where

import Prelude

import Control.Alt ((<|>))
import Data.DateTime.Instant (unInstant)
import Data.Newtype (unwrap)
import Data.Number ((%))
import Deku.Control (text_)
import Deku.DOM as D
import Deku.DOM.Attributes as DA
import Deku.Toplevel (runInBody)
import Effect (Effect)
import ExampleAssitant (ExampleSignature)
import FRP.Event.Time (interval)
import FRP.Poll (sham)

app :: ExampleSignature
app runExample = do
  let labelMe label = map { label, time: _ }
  pink <- interval 200
  green <- interval 165
  let quit = pink.unsubscribe *> green.unsubscribe
  append <$> pure quit <*> runExample do
    D.div
      [ DA.klass
          $
            sham
              ( labelMe "bg-pink-300" pink.event <|>
                  labelMe "bg-green-300" green.event
              ) <#> \{ label, time } ->
              if ((unwrap $ unInstant time) % 4000.0 < 2000.0) then label
              else "bg-pink-800"
      ]
      [ text_ "Par-tay!" ]

main :: Effect Unit
main = void $ app runInBody