module Pages.FRP.OtherInstances.Ring.EventsAsRings where

import Prelude

import Components.Code (psCode)
import Components.ExampleBlockquote (exampleBlockquote)
import Constants (tripleQ)
import Contracts (Subsection, subsection)
import Data.Foldable (traverse_)
import Data.Tuple.Nested ((/\))
import Deku.Attribute (cb, (!:=))
import Deku.Attributes (klass_)
import Deku.Control (text, text_)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useState)
import Deku.Listeners (slider_)
import QualifiedDo.Alt as Alt
import Web.Event.Event (target)
import Web.HTML.HTMLInputElement (fromEventTarget, valueAsNumber)

eventsAsRings :: forall lock payload. Subsection lock payload
eventsAsRings = subsection
  { title: "Events as rings"
  , matter: pure
      [ D.p_
          [ text_ "Events are also rings in case you need to "
          , D.code__ "mod"
          , text_ " or "
          , D.code__ "sub"
          , text_ " them."
          ]
          , psCode """module Main where

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
import QualifiedDo.Alt as Alt

main :: Effect Unit
main = runInBody Deku.do
  setNumber1 /\ number1 <- useState 50.0
  setNumber2 /\ number2 <- useState 50.0
  D.div_
    [ D.div_
        [ D.input
            Alt.do
              klass_ "w-full"
              slider_ setNumber1
            []
        ]
    , D.div_
        [ D.input
            Alt.do
              klass_ "w-full"
              slider_ setNumber2
            []
        ]
    , D.div_
        [ text (show <$> number1)
        , text_ " - "
        , text (show <$> number2)
        , text_ " = "
        , text (show <$> number1 - number2)
        ]
    ]"""
      , exampleBlockquote
          [ Deku.do
              setNumber1 /\ number1 <- useState 50.0
              setNumber2 /\ number2 <- useState 50.0
              D.div_
                [ D.div_
                    [ D.input
                        Alt.do
                          klass_ "w-full"
                          slider_ setNumber1
                        []
                    ]
                , D.div_
                    [ D.input
                        Alt.do
                          klass_ "w-full"
                          slider_ setNumber2
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
          ]
      ]
  }
