module Examples.AltAsAMuxer where

import Deku.Toplevel (runInBody)
import Prelude
import ExampleAssitant (ExampleSignature)

import Control.Alt ((<|>))
import Deku.Attributes (klass)
import Deku.Control (text)
import Deku.DOM as D

import FRP.Event.Time (interval)

main :: ExampleSignature
main runExample = do
  i0 <- interval 200
  i1 <- interval 165
  runExample do
    D.div
      [ klass
          ( (i0.event $> "bg-pink-300")
              <|> (i1.event $> "bg-green-300")
          )
      ]
      [ text "Par-tay!" ]