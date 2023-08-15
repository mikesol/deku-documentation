module Examples.AltAsAMuxer where

import Deku.Toplevel (runInBody')
import Effect (Effect)
import Prelude
import ExampleAssitant (ExampleSignature)

import Control.Alt ((<|>))
import Deku.Attributes (klass, klass_)
import Deku.Control (text, text_)
import Deku.DOM as D

import FRP.Event.Time (interval)

app :: ExampleSignature
app runExample = do
  i0 <- interval 200
  i1 <- interval 165
  runExample do
    D.div
      [ klass
          ( (i0.event $> "bg-pink-300")
              <|> (i1.event $> "bg-green-300")
          )
      ]
      [ text_ "Par-tay!" ]

main :: Effect Unit
main = void $ app (map (map void) runInBody')