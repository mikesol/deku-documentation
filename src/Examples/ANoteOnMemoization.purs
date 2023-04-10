module Examples.ANoteOnMemoization where

import Prelude

import Data.String (replaceAll, Pattern(..), Replacement(..))
import Data.Tuple.Nested ((/\))
import Deku.Attributes (klass_)
import Deku.Control (guard, text, text_)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useState)
import Deku.Listeners (click, click_)
import Deku.Toplevel (runInBody)
import Effect (Effect)
import Effect.Random (random)

buttonClass :: String -> String
buttonClass color =
  replaceAll (Pattern "COLOR") (Replacement color)
    """ml-4 inline-flex items-center rounded-md
border border-transparent bg-COLOR-600 px-3 py-2
text-sm font-medium leading-4 text-white shadow-sm
hover:bg-COLOR-700 focus:outline-none focus:ring-2
focus:ring-COLOR-500 focus:ring-offset-2"""

main :: Effect Unit
main = do
  n <- random
  runInBody Deku.do
    setNumber /\ number <- useState n
    setPresence /\ presence <- useState false
    D.div_
      [ D.div_
          [ text $ number <#> show >>>
              ("Here's a random number: " <> _)
          ]
      , D.div_
          [ D.button
              [ klass_ $ buttonClass "pink"
              , click_ $ random >>= setNumber
              ]
              [ text_ "A" ]
          , D.button
              [ klass_ $ buttonClass "green"
              , click $ presence <#> not >>> setPresence
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