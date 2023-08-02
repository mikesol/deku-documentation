module Examples.ANoteOnMemoization where

import Prelude
import ExampleAssitant (ExampleSignature)

import Data.String (replaceAll, Pattern(..), Replacement(..))
import Data.Tuple.Nested ((/\))
import Deku.Attributes (klass)
import Deku.Control (text)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useState, guard)
import Deku.Listeners (click)

import Effect.Random (random)

buttonClass :: String -> String
buttonClass color =
  replaceAll (Pattern "COLOR") (Replacement color)
    """ml-4 inline-flex items-center rounded-md
border border-transparent bg-COLOR-600 px-3 py-2
text-sm font-medium leading-4 text-white shadow-sm
hover:bg-COLOR-700 focus:outline-none focus:ring-2
focus:ring-COLOR-500 focus:ring-offset-2"""

main :: ExampleSignature
main runExample = do
  n <- random
  runExample Deku.do
    setNumber /\ number <- useState n
    setPresence /\ presence <- useState false
    D.div_
      [ D.div_
          [ text $ number <#> show >>>
              ("Here's a random number: " <> _)
          ]
      , D.div_
          [ D.button
              [ klass $ buttonClass "pink"
              , click $ random >>= setNumber
              ]
              [ text "A" ]
          , D.button
              [ klass $ buttonClass "green"
              , click $ presence <#> not >>> setPresence
              ]
              [ text "B" ]
          ]
      , D.div_
          [ guard presence
              $ text
              $ number <#> show >>>
                  ("Here's the same random number: " <> _)
          ]
      ]