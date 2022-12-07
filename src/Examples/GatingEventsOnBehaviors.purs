module Examples.GatingEventsOnBehaviors where

import Prelude

import Control.Alt ((<|>))
import Data.DateTime.Instant (unInstant)
import Data.Newtype (unwrap)
import Data.Number ((%))
import Deku.Attributes (klass)
import Deku.Control (text_)
import Deku.DOM as D
import Deku.Toplevel (runInBody)
import Effect (Effect)
import FRP.Behavior (gateBy)
import FRP.Behavior.Time (instant)
import FRP.Event.Time (interval)

main :: Effect Unit
main = runInBody do
  D.div
    ( klass
        ( gateBy
            (\t _ -> (unwrap $ unInstant t) % 4000.0 < 2000.0)
            instant
            ( (interval 200 $> "bg-pink-300") <|>
                (interval 165 $> "bg-green-300")
            )
        )
    )
    [ text_ "Par-tay!" ]