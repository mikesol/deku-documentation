module Scratch where

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
  D.div_
    [ D.div_ $
        [ "Hickory" /\ "green"
        , "Dickory" /\ "pink"
        , "Dock" /\ "indigo"
        ] <#> \(w /\ k) -> D.button
          (klass_ (buttonClass k) <|> click_ (setWord w))
          [ text_ w ]
    , D.div_
        [ text_ "Previous word: "
        , text
            ( pure "None" <|>
                ( show <$>
                    ( compact $ snd <$> fix
                        ( \e -> sampleOnRight
                            (pure (Nothing) <|> (fst <$> e))
                            ((Tuple <<< Just) <$> word)
                        )
                    )
                )
            )
        ]
    ]
