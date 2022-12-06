module Pages.FRP.OtherInstances.Ring.EventsAsSemirings where

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
import QualifiedDo.Alt as Alt
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

example :: String
example =
  """module Main where

import Prelude

import Data.Tuple.Nested ((/\))
import Deku.Attributes (klass_)
import Deku.Control (text, text_)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useState)
import Deku.Toplevel (runInBody)
import Effect (Effect)
import Data.Foldable (traverse_)
import Deku.Attribute (cb, (!:=))
import QualifiedDo.Alt as Alt
import Web.Event.Event (target)
import Web.HTML.HTMLInputElement (fromEventTarget, valueAsNumber)

inputKls :: String
inputKls =
  """ <> tripleQ
    <>
      """rounded-md
border-gray-300 shadow-sm
border-2 mr-2
border-solid
focus:border-indigo-500 focus:ring-indigo-500
sm:text-sm"""
    <> tripleQ
    <>
      """

main :: Effect Unit
main = runInBody Deku.do
  setNumber /\ number <- useState 0.0
  D.div_
    [ D.div_
        [ D.div_
            [ text_
                """
    <> tripleQ
    <>
      """To use our super-secure
cryptographic number changer, type a number below
and we'll output a number that you can't
reverse engineer, or your money back!"""
    <> tripleQ
    <>
      """
            ]
        , D.input
            Alt.do
              klass_ inputKls
              D.Xtype !:= "number"
              D.Min !:= "0"
              D.Value !:= "0"
              D.OnChange !:= cb \evt ->
                traverse_ (valueAsNumber >=> setNumber) $
                  (target >=> fromEventTarget) evt
            []
        ]
    , D.div_
        [ text_ "Result: "
        , text (show <$> ((one + one) * number + one))
        ]
    ]
"""

eventsAsSemirings :: forall lock payload. Subsection lock payload
eventsAsSemirings = subsection
  { title: "Events as semirings"
  , matter: pure
      [ D.p_
          [ text_ "As "
          , D.code__ "Semiring"
          , text_
              "s, events can be added and multiplied. If you feel like it, you can even count with combinations of "
          , D.code__ "one"
          , text_ " and "
          , D.code__ "zero"
          , text_ "!"
          ]
      , psCode example
      , exampleBlockquote
          [ Deku.do
              setNumber /\ number <- useState 0.0
              D.div_
                [ D.div_
                    [ D.div_
                        [ text_
                            "To use our super-secure cryptographic number changer, type a number below and we'll output a number that you can't reverse engineer, or your money back!"
                        ]
                    , D.input
                        Alt.do
                          klass_ inputKls
                          D.Xtype !:= "number"
                          D.Min !:= "0"
                          D.Value !:= "0"
                          D.OnChange !:= cb \evt ->
                            traverse_ (valueAsNumber >=> setNumber) $
                              (target >=> fromEventTarget) evt
                        []
                    ]
                , D.div_
                    [ text_ "Result: "
                    , text (show <$> ((one + one) * number + one))
                    ]
                ]
          ]
      ]
  }
