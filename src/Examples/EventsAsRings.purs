module Examples.EventsAsRings where

import Prelude

import Data.Tuple.Nested ((/\))
import Deku.Attributes (klass_)
import Deku.Control (text, text_)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useState)
import Deku.Listeners (slider_)
import Deku.Toplevel (runInBody)
import Effect (Effect)

main :: Effect Unit
main = runInBody Deku.do
  setNumber1 /\ number1 <- useState 50.0
  setNumber2 /\ number2 <- useState 50.0
  D.div_
    [ D.div_
        [ D.input
            [ klass_ "w-full"
            , slider_ setNumber1
            ]
            []
        ]
    , D.div_
        [ D.input
            [ klass_ "w-full"
            , slider_ setNumber2
            ]
            []
        ]
    , D.div_
        [ text (show <$> number1)
        , text_ " - "
        , text (show <$> number2)
        , text_ " = "
        , text (show <$> number1 - number2)
        ]
    ]