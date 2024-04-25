module Examples.ALagUsingFix where

import Prelude

import Control.Alt ((<|>))
import Data.Compactable (compact)
import Data.Maybe (Maybe(..))
import Data.String (Pattern(..), Replacement(..), replaceAll)
import Data.Tuple (Tuple(..), fst, snd)
import Data.Tuple.Nested ((/\))
import Deku.DOM.Attributes as DA
import Deku.Control (text, text_)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useState')
import Deku.DOM.Listeners as DL
import Deku.Toplevel (runInBody)
import Effect (Effect)
import ExampleAssitant (ExampleSignature)
import FRP.Event (fix, sampleOnRight)

buttonClass :: String -> String
buttonClass color =
  replaceAll (Pattern "COLOR") (Replacement color)
    """mb-3 inline-flex items-center rounded-md
border border-transparent bg-COLOR-600 px-3 py-2
text-sm font-medium leading-4 text-white shadow-sm
hover:bg-COLOR-700 focus:outline-none focus:ring-2
focus:ring-COLOR-500 focus:ring-offset-2 mr-4"""

app :: ExampleSignature
app runExample = runExample Deku.do
  setWord /\ word <- useState'
  let
    button text color = D.button
      [ DA.klass_ (buttonClass color), DL.click_ \_ -> (setWord text) ]
      [ text_ text ]
  D.div_
    [ D.div_
        [ button "Hickory" "green"
        , button "Dickory" "pink"
        , button "Dock" "indigo"
        ]
    , D.div_
        [ text_ "Previous word: "
        , text
            ( pure "None" <|>
                ( compact $ snd <$> fix
                    ( \e -> sampleOnRight
                        (pure Nothing <|> (fst <$> e))
                        ((Tuple <<< Just) <$> word)
                    )
                )
            )
        ]
    ]

main :: Effect Unit
main = void $ app $ map pure runInBody