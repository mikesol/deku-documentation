module Examples.FilteringAnEvent where

import Deku.Toplevel (runInBody)
import Prelude
import ExampleAssitant (ExampleSignature)

import Data.Filterable (filter)
import Data.NonEmpty (tail)
import Data.Tuple.Nested ((/\))
import Deku.Control (text)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useState)
import Deku.Listeners (slider)

app :: ExampleSignature
app runExample = runExample Deku.do
  setNumber /\ number <- useState 50.0
  D.div_
    [ D.input (slider setNumber) []
    , D.div_
        [ text "Latest less than 50: "
        , text (filter (_ < 50.0) (tail number) <#> show)
        ]
    , D.div_
        [ text "Latest greater than 50: "
        , text (filter (_ > 50.0) (tail number) <#> show)
        ]
    ]