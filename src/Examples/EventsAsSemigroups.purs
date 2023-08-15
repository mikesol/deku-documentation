module Examples.EventsAsSemigroups where

import Deku.Toplevel (runInBody')
import Effect (Effect)
import Prelude

import Data.Tuple.Nested ((/\))
import Deku.Attributes (klass, klass_)
import Deku.Control (text, text_)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useState')
import Deku.Listeners (click, click_)
import ExampleAssitant (ExampleSignature)

buttonClass =
  """inline-flex items-center rounded-md
border border-transparent bg-indigo-600 px-3 py-2
text-sm font-medium leading-4 text-white shadow-sm
hover:bg-indigo-700 focus:outline-none focus:ring-2
focus:ring-indigo-500 focus:ring-offset-2 mr-6""" :: String

app :: ExampleSignature
app runExample = runExample Deku.do
  setKlass1 /\ klass1 <- useState'
  setKlass2 /\ klass2 <- useState'
  let
    button setter txt = D.button
      [ klass_ buttonClass, click (setter txt) ]
      [ text txt ]
  D.div_
    [ D.div_ $
        [ button setKlass1 "text-2xl"
        , button setKlass1 "text-sm"
        , button setKlass2 "text-orange-500"
        , button setKlass2 "text-green-300"
        ]
    , D.div_
        [ D.span
            [ klass_ "text-sm text-green-500"
            , klass ((klass1 <#> (_ <> " ")) <> klass2)
            ]
            [ text_ "Hello!" ]
        ]
    ]

main :: Effect Unit
main = void $ app (map (map void) runInBody')