module Pages.FRP.OtherInstances.Ring.EventsAsSemirings where

import Prelude

import Components.Code (psCodeWithLink)
import Components.ExampleBlockquote (exampleBlockquote)
import Contracts (Subsection, subsection)
import Data.Foldable (traverse_)
import Data.Tuple.Nested ((/\))
import Deku.Attribute (cb, (:=))
import Deku.Attributes (klass)
import Deku.Control (text)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useState)
import Examples as Examples
import Web.Event.Event (target)
import Web.HTML.HTMLInputElement (fromEventTarget, valueAsNumber)

inputKls :: String
inputKls =
  """rounded-md
border-gray-300 shadow-sm
border-2 mr-2
border-solid
focus:border-indigo-500 focus:ring-indigo-500
sm:text-sm"""

eventsAsSemirings :: Subsection
eventsAsSemirings = subsection
  { title: "Events as semirings"
  , matter: pure
      [ D.p_
          [ text "As "
          , D.code__ "Semiring"
          , text
              "s, events can be added and multiplied. If you feel like it, you can even count with combinations of "
          , D.code__ "one"
          , text " and "
          , D.code__ "zero"
          , text "!"
          ]
      , psCodeWithLink Examples.EventsAsSemirings
      , exampleBlockquote
          [ Deku.do
              setNumber /\ number <- useState 0.0
              D.div_
                [ D.div_
                    [ D.div_
                        [ text
                            "To use our super-secure cryptographic number changer, type a number below and we'll output a number that you can't reverse engineer, or your money back!"
                        ]
                    , D.input
                         [klass inputKls,
                          D.Xtype := "number",
                          D.Min := "0",
                          D.Value := "0",
                          D.OnChange := cb \evt ->
                            traverse_ (valueAsNumber >=> setNumber) $
                              (target >=> fromEventTarget) evt]
                        []
                    ]
                , D.div_
                    [ text "Result: "
                    , text (show <$> ((one + one) * number + one))
                    ]
                ]
          ]
      ]
  }
