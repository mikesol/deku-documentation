module Examples.KnowThySelfT where

import Prelude

import Data.Tuple.Nested ((/\))
import Deku.Control (text)
import Deku.DOM as D
import Deku.DOM.Attributes as DA
import Deku.DOM.Listeners as DL
import Deku.DOM.Self as Self
import Deku.Do as Deku
import Deku.Hooks (useState')
import Deku.Toplevel (runInBody')
import Effect (Effect)
import ExampleAssitant (ExampleSignature)
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
        [ DA.klass_ inputKls
        , DL.input $ input <#> \i _ -> value i >>= setTxt
        , Self.selfT_ setInput
        ]
        []
    , D.div_ [ text txt ]
    ]

main :: Effect Unit
main = void $ app (map (map void) runInBody')