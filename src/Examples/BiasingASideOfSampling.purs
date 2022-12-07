module Examples.BiasingASideOfSampling where

import Prelude

import Data.Tuple.Nested ((/\))
import Deku.Attributes (klass_)
import Deku.Control (text)
import Deku.Core (fixed)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useState')
import Deku.Listeners (slider_)
import Deku.Toplevel (runInBody)
import Effect (Effect)
import FRP.Event.Class ((<|**>), (<|*>), (<**|>), (<*|>))

main :: Effect Unit
main = runInBody Deku.do
  setSlider /\ slider <- useState'
  fixed
    [ D.div (klass_ "flex justify-around")
        [ D.input (slider_ setSlider) [] ]
    , text
        ( slider <|**>
            ((\a b -> show b <> " " <> show a) <$> slider)
        )
    , D.br_ []
    , text
        ( slider <**|>
            ((\a b -> show b <> " " <> show a) <$> slider)
        )
    , D.br_ []
    , text
        ( ((\a b -> show a <> " " <> show b) <$> slider)
            <|*> slider
        )
    , D.br_ []
    , text
        ( ((\a b -> show a <> " " <> show b) <$> slider)
            <*|> slider
        )
    ]