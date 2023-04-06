module Examples.UseRef where

import Prelude

import Data.Array (replicate)
import Data.Tuple.Nested ((/\))
import Deku.Attributes (klass_)
import Deku.Control (text)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useRef, useState)
import Deku.Listeners (click_, slider_)
import Deku.Toplevel (runInBody)
import Effect (Effect)

buttonClass =
  """inline-flex items-center rounded-md
border border-transparent bg-pink-600 px-3 py-2
text-sm font-medium leading-4 text-white shadow-sm
hover:bg-pink-700 focus:outline-none focus:ring-2
focus:ring-pink-500 focus:ring-offset-2 m-2""" :: String

main :: Effect Unit
main = runInBody Deku.do
  let initial = 50.0
  setNum /\ num <- useState initial
  intRef <- useRef initial num
  D.div_
    [ D.input
        [ slider_ setNum ]
        []
    , D.div [ klass_ "grid grid-flow-row grid-cols-3" ]
        ( replicate 24 Deku.do
            setButtonText /\ buttonText <- useState "Waiting..."
            D.button
              [ klass_ buttonClass
              , click_ $ intRef >>= show >>> setButtonText
              ]
              [ text buttonText ]
        )
    ]
