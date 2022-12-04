module Scratch where

import Prelude

import Data.Array (intercalate)
import Deku.Control (text)
import Deku.Toplevel (runInBody)
import Effect (Effect)
import FRP.Event (fold)
import FRP.Event.Time (interval)

main :: Effect Unit
main = runInBody do
  let
    alternate e a b = fold (flip (const not)) true e
      <#> if _ then a else b
  text
    $ intercalate (pure " ")
        [ alternate (interval 704) "Functional" "Imperative"
        , pure "programming"
        , alternate (interval 1222) "is" "isn't"
        , alternate (interval 568) "fun!" "boring!"
        ]
