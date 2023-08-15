module Examples.BiasingASideOfSampling where

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

import FRP.Event.Class ((<|**>), (<|*>), (<**|>), (<*|>))

app :: ExampleSignature
app runExample = runExample Deku.do
  setSlider /\ sliderE <- useState'
  fixed
    [ D.div [ klass_ "flex justify-around" ]
        [ D.input (slider setSlider) [] ]
    , text
        ( sliderE <|**>
            ((\a b -> show b <> " " <> show a) <$> sliderE)
        )
    , D.br_ []
    , text
        ( sliderE <**|>
            ((\a b -> show b <> " " <> show a) <$> sliderE)
        )
    , D.br_ []
    , text
        ( ((\a b -> show a <> " " <> show b) <$> sliderE)
            <|*> sliderE
        )
    , D.br_ []
    , text
        ( ((\a b -> show a <> " " <> show b) <$> sliderE)
            <*|> sliderE
        )
    ]

main :: Effect Unit
main = void $ app (map (map void) runInBody')