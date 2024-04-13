module Examples.FauxHooks where

import Prelude

import Data.Tuple.Nested ((/\))
import Deku.Control (text, text_)
import Deku.DOM as D
import Deku.DOM.Attributes as DA
import Deku.DOM.Listeners as DL
import Deku.Do as Deku
import Deku.Effect as DE
import Deku.Hooks as DH
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
  nD <- random
  setNumberE /\ numberE <- random >>= DE.useState
  runExample Deku.do
    setNumberD /\ numberD <- DH.useState nD
    D.div_
      [ D.button
          [ DA.klass_ buttonClass
          , DL.click_ \_ ->
              let go x = random >>= x in go setNumberE *> go setNumberD
          ]
          [ text_ "Update number" ]
      , D.div_
          [ text $ numberD <#>
              show >>> ("Here's a random number: " <> _)
          ]
      , D.div_
          [ text $ numberE <#>
              show >>> ("Here's a random number: " <> _)
          ]
      ]

main :: Effect Unit
main = void $ app $ map pure runInBody