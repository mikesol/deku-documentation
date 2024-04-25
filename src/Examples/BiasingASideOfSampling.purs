module Examples.BiasingASideOfSampling where

import Prelude

import Data.Tuple.Nested ((/\))
import Deku.DOM.Attributes as DA
import Deku.Control (text)
import Deku.Core (fixed)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useState')
import Deku.DOM.Listeners as DL
import Deku.Toplevel (runInBody)
import Effect (Effect)
import ExampleAssitant (ExampleSignature)
import FRP.Event.Class ((<|**>), (<|*>), (<**|>), (<*|>))

app :: ExampleSignature
app runExample = runExample Deku.do
  setSlider /\ slider <- useState'
  fixed
    [ D.div [ DA.klass_ "flex justify-around" ]
        [ D.input [ DA.xtypeRange, DL.numberOn_ DL.input setSlider ] [] ]
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

main :: Effect Unit
main = void $ app $ map pure runInBody