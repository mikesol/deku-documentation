module Examples.AWayToMemoize where

import Prelude

import Control.Alternative as Alt
import Data.NonEmpty ((:|))
import Data.String (replaceAll, Pattern(..), Replacement(..))
import Data.Tuple.Nested ((/\))
import Deku.Attributes (klass)
import Deku.Control (text)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (guardWith, useState, useState')
import Deku.Listeners (click)
import Deku.NonEmpty (rehead)
import Deku.Toplevel (runInBody')
import Effect (Effect)
import Effect.Random (random)
import ExampleAssitant (ExampleSignature)
import FRP.Behavior (sampleBy, stepNE)

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
  runExample Deku.do
    setNumber /\ number <- useState n
    setPresence /\ presence <- useState'
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
              , click $ false :| presence <#> not >>> setPresence
              ]
              [ text "B" ]
          ]
      , D.div_
          [ guardWith
              (sampleBy (\v b -> Alt.guard b $> v) (stepNE number) presence)
              \v ->
                text $ rehead v number <#> show >>>
                  ("Here's the same random number: " <> _)
          ]
      ]

main :: Effect Unit
main = void $ app (map (map void) runInBody')