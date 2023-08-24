module Examples.FilteringAnEvent where

import Prelude

import Data.Filterable (filter)
import Data.Tuple.Nested ((/\))
import Deku.Control (text, text_)
import Deku.DOM as D
import Deku.DOM.Attributes as DA
import Deku.DOM.Listeners as DL
import Deku.Do as Deku
import Deku.Hooks (useState)
import Deku.Toplevel (runInBody')
import Effect (Effect)
import ExampleAssitant (ExampleSignature)

app :: ExampleSignature
app runExample = runExample Deku.do
  setNumber /\ number <- useState 50.0
  D.div_
    [ D.input [ DA.xtypeRange, DL.numberOn_ DL.input setNumber ] []
    , D.div_
        [ text_ "Latest less than 50: "
        , text (filter (_ < 50.0) number <#> show)
        ]
    , D.div_
        [ text_ "Latest greater than 50: "
        , text (filter (_ > 50.0) number <#> show)
        ]
    ]

main :: Effect Unit
main = void $ app (map (map void) runInBody')