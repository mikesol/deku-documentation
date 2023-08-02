module Examples.GatingEventsOnBehaviors where

import Prelude

import Control.Alt ((<|>))
import Data.DateTime.Instant (unInstant)
import Data.Newtype (unwrap)
import Data.Number ((%))
import Deku.Attributes (klass)
import Deku.Control (text)
import Deku.DOM as D
import Deku.Toplevel (runInBody)
import Effect (Effect)
import FRP.Behavior (gateBy)
import FRP.Behavior.Time (instant)
import FRP.Event.Time (interval)

main :: Effect Unit
main = do
  i0 <- interval 200
  i1 <- interval 165
  runInBody do
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
      [ text "Par-tay!" ]