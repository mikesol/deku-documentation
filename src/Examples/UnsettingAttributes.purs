module Examples.UnsettingAttributes where

import Prelude

import Control.Alternative (guard)
import Data.String (Pattern(..), Replacement(..), replaceAll)
import Data.Tuple.Nested ((/\))
import Deku.Attribute ((:=))
import Deku.Attributes (klass)
import Deku.Control (text)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useState)
import Deku.Listeners (click)
import Deku.NonEmpty (filterMapAttribute)
import Deku.Toplevel (runInBody')
import Effect (Effect)
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
app runExample = runExample Deku.do
  setStyleSwitch /\ styleSwitch <- useState false
  D.div_
    [ D.a
        [ D.Target := "_blank"
        , filterMapAttribute D.Style (\x -> guard x $> "color:magenta;") styleSwitch
        , filterMapAttribute D.Style (\x -> guard (not x) $> unit) $ styleSwitch
        ]
        [ text "Click me" ]
    , D.button
        [ klass $ buttonClass "pink"
        , click $ styleSwitch <#> not >>> setStyleSwitch
        ]
        [ text "Switch style" ]
    ]

main :: Effect Unit
main = void $ app (map (map void) runInBody')