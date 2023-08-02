module Examples.SeveralLagsUsingFix where

import Prelude
import ExampleAssitant (ExampleSignature)

import Data.Compactable (compact)
import Data.Maybe (Maybe(..))
import Data.NonEmpty ((:|))
import Data.String (Pattern(..), Replacement(..), replaceAll)
import Data.Tuple (Tuple(..), fst, snd)
import Data.Tuple.Nested ((/\))
import Deku.Attributes (klass)
import Deku.Control (text)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useState')
import Deku.Listeners (click)

import FRP.Behavior (sample, step)
import FRP.Event (fix)

buttonClass :: String -> String
buttonClass color =
  replaceAll (Pattern "COLOR") (Replacement color)
    """mb-3 inline-flex items-center rounded-md
border border-transparent bg-COLOR-600 px-3 py-2
text-sm font-medium leading-4 text-white shadow-sm
hover:bg-COLOR-700 focus:outline-none focus:ring-2
focus:ring-COLOR-500 focus:ring-offset-2 mr-4"""

main :: ExampleSignature
main runExample = runExample Deku.do
  setWord /\ word <- useState'
  let
    lag n e
      | n <= 0 = e
      | otherwise =
          compact $ snd <$> fix
            ( \ev -> sample
                (step Nothing (fst <$> ev))
                ((Tuple <<< Just) <$> lag (n - 1) e)
            )
    button txt color = D.button
      [ klass (buttonClass color), click (setWord txt) ]
      [ text txt ]
  D.div_
    [ D.div_ $
        [ button "Hickory" "green"
        , button "Dickory" "pink"
        , button "Dock" "indigo"
        ]
    , D.div_ $ [ 0, 1, 2, 3, 4 ] <#> \n -> D.div_
        [ text $ "Word with a lag of " <> show n <> ": "
        , text ("None" :| lag n word)
        ]
    ]