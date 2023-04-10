module Examples.FilteringAnEvent where

import Prelude

import Data.Tuple.Nested ((/\))
import Deku.Toplevel (runInBody)
import Effect (Effect)
import Data.Filterable (filter)
import Deku.Control (text, text_)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useState)
import Deku.Listeners (slider_)

main :: Effect Unit
main = runInBody Deku.do
  setNumber /\ number <- useState 50.0
  D.div_
    [ D.input [ slider_ setNumber ] []
    , D.div_
        [ text_ "Latest less than 50: "
        , text (filter (_ < 50.0) number <#> show)
        ]
    , D.div_
        [ text_ "Latest greater than 50: "
        , text (filter (_ > 50.0) number <#> show)
        ]
    ]