module Examples.ASimpleCounter where

import Prelude

import Data.Tuple.Nested ((/\))
import Deku.DOM.Attributes as DA
import Deku.Control (text, text_)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useState)
import Deku.DOM.Listeners as DL
import Deku.Toplevel (runInBody)
import Effect (Effect)
import ExampleAssitant (ExampleSignature)
import FRP.Event (fold)

buttonClass =
  """inline-flex items-center rounded-md
border border-transparent bg-indigo-600 px-3 py-2
text-sm font-medium leading-4 text-white shadow-sm
hover:bg-indigo-700 focus:outline-none focus:ring-2
focus:ring-indigo-500 focus:ring-offset-2 mr-6""" :: String

app :: ExampleSignature
app runExample = runExample Deku.do
  setCount /\ count <- useState 0
  D.div_
    [ D.button
        [ DA.klass_ buttonClass
        , DL.runOn DL.click $ count <#> (add 1 >>> setCount)
        ]
        [ text_ "Increment" ]
    , D.div_
        [ text_ "Counter 1 using state hooks: "
        , text (show <$> count)
        ]
    , D.div_
        [ text_ "Counter 2 using "
        , D.code__ "fold"
        , text_ ": "
        , text (show <$> (fold (pure <$> add 1) (-1) count))
        ]
    ]

main :: Effect Unit
main = void $ app runInBody