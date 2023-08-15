module Examples.HowSamplingWorks where

import Deku.Toplevel (runInBody')
import Effect (Effect)
import Prelude
import ExampleAssitant (ExampleSignature)

import Data.Tuple.Nested ((/\))
import Deku.Attributes (klass, klass_)
import Deku.Control (text, text_)
import Deku.Core (fixed)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useState')
import Deku.Listeners (slider)

import FRP.Event.Class ((<|**>))

app :: ExampleSignature
app runExample = runExample Deku.do
  setSlider1 /\ slider1 <- useState'
  setSlider2 /\ slider2 <- useState'
  fixed
    [ D.div [ klass_ "flex justify-around" ]
        [ D.input (slider setSlider1) []
        , D.input (slider setSlider2) []
        ]
    , text
        ( slider1 <|**>
            ((\a b -> show b <> " " <> show a) <$> slider2)
        )
    ]

main :: Effect Unit
main = void $ app (map (map void) runInBody')