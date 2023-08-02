module Examples.ASimpleCounter where

import Deku.Toplevel (runInBody')
import Effect (Effect)
import Prelude
import ExampleAssitant (ExampleSignature)

import Data.NonEmpty ((:|))
import Data.Tuple.Nested ((/\))
import Deku.Attributes (klass)
import Deku.Control (text)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useState')
import Deku.Listeners (click)
import FRP.Event (fold)

buttonClass =
  """inline-flex items-center rounded-md
border border-transparent bg-indigo-600 px-3 py-2
text-sm font-medium leading-4 text-white shadow-sm
hover:bg-indigo-700 focus:outline-none focus:ring-2
focus:ring-indigo-500 focus:ring-offset-2 mr-6""" :: String

app :: ExampleSignature
app runExample = runExample Deku.do
  setCount /\ count <- useState'
  D.div_
    [ D.button
        [ klass buttonClass
        , click $ count <#> (add 1 >>> setCount)
        ]
        [ text "Increment" ]
    , D.div_
        [ text "Counter 1 using state hooks: "
        , text (show <$> count)
        ]
    , D.div_
        [ text "Counter 2 using "
        , D.code__ "fold"
        , text ": "
        , text (show <$> 0 :| (fold (pure <$> add 1) 0 count))
        ]
    ]

main :: Effect Unit
main = void $ app (map (map void) runInBody')