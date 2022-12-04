module Scratch where

import Prelude

import Control.Alt ((<|>))
import Deku.Control (text)
import Deku.Toplevel (runInBody)
import Effect (Effect)
import FRP.Event (fold, keepLatest)
import FRP.Event.Time (interval)

main :: Effect Unit
main = runInBody do
  let count = fold (flip (const (add 1))) 0
  text
    ( show <$> keepLatest
        ( interval 1000 $>
            (pure 0 <|> count (interval 400))
        )
    )

