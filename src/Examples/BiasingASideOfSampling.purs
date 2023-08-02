module Examples.BiasingASideOfSampling where

import Prelude

import Data.Tuple.Nested ((/\))
import Deku.Attributes (klass)
import Deku.Control (text)
import Deku.Core (fixed)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useState')
import Deku.Listeners (slider)
import Deku.Toplevel (runInBody)
import Effect (Effect)
import FRP.Event.Class ((<|**>), (<|*>), (<**|>), (<*|>))

main :: Effect Unit
main = runInBody Deku.do
  setSlider /\ sliderE <- useState'
  fixed
    [ D.div [ klass "flex justify-around" ]
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