module Examples.AltAsAMuxer where

import Prelude

import Control.Alt ((<|>))
import Deku.Attributes (klass)
import Deku.Control (text)
import Deku.DOM as D
import Deku.Toplevel (runInBody)
import Effect (Effect)
import FRP.Event.Time (interval)

main :: Effect Unit
main = do
  i0 <- interval 200
  i1 <- interval 165
  runInBody do
    D.div
      [ klass
          ( (i0.event $> "bg-pink-300")
              <|> (i1.event $> "bg-green-300")
          )
      ]
      [ text "Par-tay!" ]