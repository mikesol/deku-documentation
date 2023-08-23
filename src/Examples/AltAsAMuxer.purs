module Examples.AltAsAMuxer where

import Prelude

import Control.Alt ((<|>))
import Deku.DOM.Attributes as DA
import Deku.Control (text_)
import Deku.DOM as D
import Deku.Toplevel (runInBody')
import Effect (Effect)
import ExampleAssitant (ExampleSignature)
import FRP.Event.Time (interval)
import FRP.Poll (sham)

app :: ExampleSignature
app runExample = do
  i0 <- interval 200
  i1 <- interval 165
  runExample.t do
    D.div
      [ DA.klass
          ( sham
              ( (i0.event $> "bg-pink-300")
                  <|> (i1.event $> "bg-green-300")
              )
          )
      ]
      [ text_ "Par-tay!" ]

main :: Effect Unit
main = void $ app { t: map (map void) runInBody' }