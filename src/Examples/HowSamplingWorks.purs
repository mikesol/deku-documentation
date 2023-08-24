module Examples.HowSamplingWorks where

import Prelude

import Data.Tuple.Nested ((/\))
import Deku.DOM.Attributes as DA
import Deku.Control (text)
import Deku.Core (fixed)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useState')
import Deku.DOM.Listeners as DL
import Deku.Toplevel (runInBody')
import Effect (Effect)
import ExampleAssitant (ExampleSignature)
import FRP.Event.Class ((<|**>))

app :: ExampleSignature
app runExample = runExample Deku.do
  setSlider1 /\ slider1 <- useState'
  setSlider2 /\ slider2 <- useState'
  fixed
    [ D.div [ DA.klass_ "flex justify-around" ]
        [ D.input [ DA.xtypeRange, DL.numberOn_ DL.input setSlider1 ] []
        , D.input [ DA.xtypeRange, DL.numberOn_ DL.input setSlider2 ] []
        ]
    , text
        ( slider1 <|**>
            ((\a b -> show b <> " " <> show a) <$> slider2)
        )
    ]

main :: Effect Unit
main = void $ app (map (map void) runInBody')