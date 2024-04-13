module Examples.MemoizedNoEvent where

import Prelude

import Control.Alt ((<|>))
import Data.Array (replicate)
import Data.Int (floor, pow)
import Data.Tuple.Nested ((/\))
import Deku.Control (text)
import Deku.DOM as D
import Deku.DOM.Attributes as DA
import Deku.DOM.Listeners as DL
import Deku.Do as Deku
import Deku.Hooks (useRant')
import Deku.Toplevel (runInBody)
import Effect (Effect)
import ExampleAssitant (ExampleSignature)

inputKls :: String
inputKls =
  """rounded-md
border-gray-300 shadow-sm
border-2 mr-2
border-solid
focus:border-indigo-500 focus:ring-indigo-500
sm:text-sm"""

app :: ExampleSignature
app runExample = runExample Deku.do
  setNumber /\ number <- useRant' (map (_ `pow` 2))
  D.div_
    [ D.div_
        [ D.input
            [ DA.klass_ inputKls
            , DA.xtypeNumber
            , DA.min_ "0"
            , DA.max_ "100"
            , DA.value_ "0"
            , DL.numberOn_ DL.change (floor >>> setNumber)
            ]
            []
        ]
    , D.div_
        ( replicate 200 $ D.span_
            [ text (show >>> (_ <> " ") <$> (pure 0 <|> number)) ]
        )
    ]

main :: Effect Unit
main = void $ app $ map pure runInBody