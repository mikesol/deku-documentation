module Examples.EventsAsRings where

import Prelude

import Data.Tuple.Nested ((/\))
import Deku.Attributes (klass)
import Deku.Control (text)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useState)
import Deku.Listeners (slider)
import Deku.Toplevel (runInBody)
import Effect (Effect)

main :: Effect Unit
main = runInBody Deku.do
  setNumber1 /\ number1 <- useState 50.0
  setNumber2 /\ number2 <- useState 50.0
  D.div_
    [ D.div_
        [ D.input
            [ klass "w-full"
            , slider setNumber1
            ]
            []
        ]
    , D.div_
        [ D.input
            [ klass "w-full"
            , slider setNumber2
            ]
            []
        ]
    , D.div_
        [ text (show <$> number1)
        , text " - "
        , text (show <$> number2)
        , text " = "
        , text (show <$> number1 - number2)
        ]
    ]