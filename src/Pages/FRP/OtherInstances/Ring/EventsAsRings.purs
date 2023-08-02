module Pages.FRP.OtherInstances.Ring.EventsAsRings where

import Prelude

import Components.Code (psCodeWithLink)
import Components.ExampleBlockquote (exampleBlockquote)
import Contracts (Subsection, subsection)
import Data.Tuple.Nested ((/\))
import Deku.Attributes (klass)
import Deku.Control (text)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useState)
import Deku.Listeners (slider)
import Examples as Examples

eventsAsRings :: Subsection
eventsAsRings = subsection
  { title: "Events as rings"
  , matter: pure
      [ D.p_
          [ text "Events are also rings in case you need to "
          , D.code__ "mod"
          , text " or "
          , D.code__ "sub"
          , text " them."
          ]
      , psCodeWithLink Examples.EventsAsRings
      , exampleBlockquote
          [ Deku.do
              setNumber1 /\ number1 <- useState 50.0
              setNumber2 /\ number2 <- useState 50.0
              D.div_
                [ D.div_
                    [ D.input
                          [klass "w-full",
                          slider setNumber1]
                        []
                    ]
                , D.div_
                    [ D.input
                          [klass "w-full",
                          slider setNumber2]
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
          ]
      ]
  }
