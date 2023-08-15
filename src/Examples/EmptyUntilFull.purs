module Examples.EmptyUntilFull where

import Deku.Toplevel (runInBody')
import Effect (Effect)
import Prelude
import ExampleAssitant (ExampleSignature)

import Data.Tuple.Nested ((/\))
import Deku.Attributes (klass, klass_)
import Deku.Control (text, text_)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useState')
import Deku.Listeners (click, click_)

import Effect.Random (random)

buttonClass =
  """inline-flex items-center rounded-md
border border-transparent bg-indigo-600 px-3 py-2
text-sm font-medium leading-4 text-white shadow-sm
hover:bg-indigo-700 focus:outline-none focus:ring-2
focus:ring-indigo-500 focus:ring-offset-2 mr-6""" :: String

app :: ExampleSignature
app runExample = runExample Deku.do
  setNumber /\ number <- useState'
  D.div_
    [ D.button
        [ klass_ buttonClass
        , click $ random >>= setNumber
        ]
        [ text_ "Update number" ]
    , text $ number <#>
        show >>> ("Here's a random number: " <> _)
    ]

main :: Effect Unit
main = void $ app (map (map void) runInBody')