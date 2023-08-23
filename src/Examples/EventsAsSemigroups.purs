module Examples.EventsAsSemigroups where

import Prelude

import Data.Tuple.Nested ((/\))
import Deku.DOM.Attributes as DA

import Deku.Control (text_)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useState')
import Deku.DOM.Listeners as DL
import Deku.Toplevel (runInBody')
import Effect (Effect)
import ExampleAssitant (ExampleSignature)

buttonClass =
  """inline-flex items-center rounded-md
border border-transparent bg-indigo-600 px-3 py-2
text-sm font-medium leading-4 text-white shadow-sm
hover:bg-indigo-700 focus:outline-none focus:ring-2
focus:ring-indigo-500 focus:ring-offset-2 mr-6""" :: String

app :: ExampleSignature
app runExample = runExample.t Deku.do
  setKlass1 /\ klass1 <- useState'
  setKlass2 /\ klass2 <- useState'
  let
    button setter txt = D.button
      [ DA.klass_ buttonClass, DL.click_ \_ -> (setter txt) ]
      [ text_ txt ]
  D.div_
    [ D.div_ $
        [ button setKlass1 "text-2xl"
        , button setKlass1 "text-sm"
        , button setKlass2 "text-orange-500"
        , button setKlass2 "text-green-300"
        ]
    , D.div_
        [ D.span
            [ DA.klass_ "text-sm text-green-500"
            , DA.klass ((klass1 <#> (_ <> " ")) <> klass2)
            ]
            [ text_ "Hello!" ]
        ]
    ]

main :: Effect Unit
main = void $ app { t: map (map void) runInBody' }