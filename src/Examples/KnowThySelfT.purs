module Examples.KnowThySelfT where

import Deku.Toplevel (runInBody)
import Prelude
import ExampleAssitant (ExampleSignature)

import Data.Tuple.Nested ((/\))
import Deku.Attribute ((:=))
import Deku.Attributes (klass)
import Deku.Control (text)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useState')

import Web.HTML.HTMLInputElement (value)

inputKls :: String
inputKls =
  """rounded-md
border-gray-300 shadow-sm
border-2 mr-2
border-solid
focus:border-indigo-500 focus:ring-indigo-500
sm:text-sm """

app :: ExampleSignature
app runExample = runExample Deku.do
  setTxt /\ txt <- useState'
  setInput /\ input <- useState'
  D.div_
    [ D.input
        [ klass inputKls
        , D.OnInput := (input <#> \i -> (value i >>= setTxt))
        , D.SelfT := setInput
        ]
        []
    , D.div_ [ text txt ]
    ]
