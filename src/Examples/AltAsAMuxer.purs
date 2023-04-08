module Examples.AltAsAMuxer where

import Prelude

import Control.Alt ((<|>))
import Deku.Attributes (klass)
import Deku.Control (text_)
import Deku.DOM as D
import Deku.Toplevel (runInBody)
import Effect (Effect)
import FRP.Event.Time (interval)

main :: Effect Unit
main = runInBody do
  D.div
    [ klass
        ( (interval 200 $> "bg-pink-300")
            <|> (interval 165 $> "bg-green-300")
        )
    ]
    [ text_ "Par-tay!" ]