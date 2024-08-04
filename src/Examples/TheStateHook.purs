module Examples.TheStateHook where

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
import Effect.Random (random)
import ExampleAssitant (ExampleSignature)

buttonClass =
  """inline-flex items-center rounded-md
border border-transparent bg-indigo-600 px-3 py-2
text-sm font-medium leading-4 text-white shadow-sm
hover:bg-indigo-700 focus:outline-none focus:ring-2
focus:ring-indigo-500 focus:ring-offset-2 mr-6""" :: String

app :: ExampleSignature
app runExample = do
  n <- random
  runExample Deku.do
    setNumber /\ number <- useState n
    D.div_
      [ D.button
          [ DA.klass_ buttonClass
          , DL.click_ \_ -> random >>= setNumber
          ]
          [ text_ "Update number" ]
      , text $ number <#>
          show >>> ("Here's a random number: " <> _)
      ]

main :: Effect Unit
main = void $ app runInBody