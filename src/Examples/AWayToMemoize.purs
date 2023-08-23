module Examples.AWayToMemoize where

import Prelude

import Data.String (replaceAll, Pattern(..), Replacement(..))
import Data.Tuple.Nested ((/\))
import Deku.DOM.Attributes as DA
import Deku.Control (text, text_)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (guard, useHot, useState)
import Deku.DOM.Listeners as DL
import Deku.Toplevel (runInBody')
import Effect (Effect)
import Effect.Random (random)
import ExampleAssitant (ExampleSignature)

buttonClass :: String -> String
buttonClass color =
  replaceAll (Pattern "COLOR") (Replacement color)
    """ml-4 inline-flex items-center rounded-md
border border-transparent bg-COLOR-600 px-3 py-2
text-sm font-medium leading-4 text-white shadow-sm
hover:bg-COLOR-700 focus:outline-none focus:ring-2
focus:ring-COLOR-500 focus:ring-offset-2"""

app :: ExampleSignature
app runExample = do
  n <- random
  runExample.t Deku.do
    setNumber /\ number <- useHot n
    setPresence /\ presence <- useState false
    D.div_
      [ D.div_
          [ text $ number <#> show >>>
              ("Here's a random number: " <> _)
          ]
      , D.div_
          [ D.button
              [ DA.klass_ $ buttonClass "pink"
              , DL.click_ \_ -> random >>= setNumber
              ]
              [ text_ "A" ]
          , D.button
              [ DA.klass_ $ buttonClass "green"
              , DL.runOn DL.click $ presence <#> not >>> setPresence
              ]
              [ text_ "B" ]
          ]
      , D.div_
          [ guard presence
              $ text
              $ number <#> show >>>
                  ("Here's the same random number: " <> _)
          ]
      ]

main :: Effect Unit
main = void $ app { t: map (map void) runInBody' }