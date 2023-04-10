module Examples.EventsAsSemigroups where

import Prelude

import Data.Tuple.Nested ((/\))
import Deku.Attributes (klass, klass_)
import Deku.Control (text_)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useState)
import Deku.Listeners (click_)
import Deku.Toplevel (runInBody)
import Effect (Effect)

buttonClass =
  """inline-flex items-center rounded-md
border border-transparent bg-indigo-600 px-3 py-2
text-sm font-medium leading-4 text-white shadow-sm
hover:bg-indigo-700 focus:outline-none focus:ring-2
focus:ring-indigo-500 focus:ring-offset-2 mr-6""" :: String

main :: Effect Unit
main = runInBody Deku.do
  setKlass1 /\ klass1 <- useState "text-sm"
  setKlass2 /\ klass2 <- useState "text-green-500"
  let
    button setter text = D.button
      [ klass_ buttonClass, click_ (setter text) ]
      [ text_ text ]
  D.div_
    [ D.div_ $
        [ button setKlass1 "text-2xl"
        , button setKlass1 "text-sm"
        , button setKlass2 "text-orange-500"
        , button setKlass2 "text-green-300"
        ]
    , D.div_
        [ D.span [ klass (klass1 <> pure " " <> klass2) ]
            [ text_ "Hello!" ]
        ]
    ]