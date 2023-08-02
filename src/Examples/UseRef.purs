module Examples.UseRef where

import Deku.Toplevel (runInBody')
import Effect (Effect)
import Prelude
import ExampleAssitant (ExampleSignature)

import Data.Array (replicate)
import Data.Tuple.Nested ((/\))
import Deku.Attributes (klass)
import Deku.Control (text)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useRefNE, useState)
import Deku.Listeners (click, slider)

buttonClass =
  """inline-flex items-center rounded-md
border border-transparent bg-pink-600 px-3 py-2
text-sm font-medium leading-4 text-white shadow-sm
hover:bg-pink-700 focus:outline-none focus:ring-2
focus:ring-pink-500 focus:ring-offset-2 m-2""" :: String

app :: ExampleSignature
app runExample = runExample Deku.do
  let initial = 50.0
  setNum /\ num <- useState initial
  intRef <- useRefNE num
  D.div_
    [ D.input (slider setNum)
        []
    , D.div [ klass "grid grid-flow-row grid-cols-3" ]
        ( replicate 24 Deku.do
            setButtonText /\ buttonText <- useState "Waiting..."
            D.button
              [ klass buttonClass
              , click $ intRef >>= show >>> setButtonText
              ]
              [ text buttonText ]
        )
    ]

main :: Effect Unit
main = void $ app (map (map void) runInBody')