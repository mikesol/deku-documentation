module Examples.HookInAnAttribute where

import Deku.Toplevel (runInBody)
import Effect (Effect)
import Prelude
import ExampleAssitant (ExampleSignature)

import Data.String (Pattern(..), Replacement(..), replaceAll)
import Data.Tuple.Nested ((/\))
import Deku.DOM.Attributes as DA
import Deku.Control (text_)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useState)
import Deku.DOM.Listeners as DL

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
  setHrefSwitch /\ hrefSwitch <- useState false
  setStyleSwitch /\ styleSwitch <- useState false
  D.div_
    [ D.a
        [ DA.target_ "_blank"
        , DA.href $ hrefSwitch <#>
            if _ then "https://cia.gov" else "https://fbi.gov"
        , DA.style $ styleSwitch <#>
            if _ then "color:magenta;" else "color:teal;"
        ]
        [ text_ "Click me" ]
    , D.button
        [ DA.klass_ $ buttonClass "indigo"
        , DL.runOn DL.click $ hrefSwitch <#> not >>> setHrefSwitch
        ]
        [ text_ "Switch href" ]
    , D.button
        [ DA.klass_ $ buttonClass "green"
        , DL.runOn DL.click $ styleSwitch <#> not >>> setStyleSwitch
        ]
        [ text_ "Switch style" ]
    ]

main :: Effect Unit
main = void $ app runInBody