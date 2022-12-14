module Examples.SeveralLagsUsingFix where

import Prelude

import Deku.Toplevel (runInBody)
import Effect (Effect)
import Control.Alt ((<|>))
import Data.Compactable (compact)
import Data.Maybe (Maybe(..))
import Data.String (Pattern(..), Replacement(..), replaceAll)
import Data.Tuple (Tuple(..), fst, snd)
import Data.Tuple.Nested ((/\))
import Deku.Attributes (klass_)
import Deku.Control (text, text_)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useState')
import Deku.Listeners (click_)
import FRP.Event (fix, sampleOnRight)

buttonClass :: String -> String
buttonClass color =
  replaceAll (Pattern "COLOR") (Replacement color)
    """mb-3 inline-flex items-center rounded-md
border border-transparent bg-COLOR-600 px-3 py-2
text-sm font-medium leading-4 text-white shadow-sm
hover:bg-COLOR-700 focus:outline-none focus:ring-2
focus:ring-COLOR-500 focus:ring-offset-2 mr-4"""

main :: Effect Unit
main = runInBody Deku.do
  setWord /\ word <- useState'
  let
    lag n e
      | n <= 0 = e
      | otherwise =
          compact $ snd <$> fix
            ( \ev -> sampleOnRight
                (pure Nothing <|> (fst <$> ev))
                ((Tuple <<< Just) <$> lag (n - 1) e)
            )
    button text color = D.button
      (klass_ (buttonClass color) <|> click_ (setWord text))
      [ text_ text ]
  D.div_
    [ D.div_ $
        [ button "Hickory" "green"
        , button "Dickory" "pink"
        , button "Dock" "indigo"
        ]
    , D.div_ $ [ 0, 1, 2, 3, 4 ] <#> \n -> D.div_
        [ text_ $ "Word with a lag of " <> show n <> ": "
        , text (pure "None" <|> lag n word)
        ]
    ]