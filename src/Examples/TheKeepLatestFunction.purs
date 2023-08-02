module Examples.TheKeepLatestFunction where

import Prelude

import Control.Alt ((<|>))
import Deku.Control (text)
import Deku.Toplevel (runInBody)
import Effect (Effect)
import FRP.Event (fold, keepLatest)
import FRP.Event.Class (once)
import FRP.Event.Time (interval)

main :: Effect Unit
main = do
  i0 <- interval 1600
  i1 <- interval 600
  runInBody do
    let count = fold (pure <$> add 1) 0
    text
      ( show <$> keepLatest
          ( i0.event $>
              ((once i0.event $> 0) <|> count i1.event)
          )
      )