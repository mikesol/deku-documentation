module Examples.HowSamplingWorks where

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
import FRP.Event.Class ((<|**>))

main :: Effect Unit
main = runInBody Deku.do
  setSlider1 /\ slider1 <- useState'
  setSlider2 /\ slider2 <- useState'
  fixed
    [ D.div (klass_ "flex justify-around")
        [ D.input (slider_ setSlider1) []
        , D.input (slider_ setSlider2) []
        ]
    , text
        ( slider1 <|**>
            ((\a b -> show b <> " " <> show a) <$> slider2)
        )
    ]