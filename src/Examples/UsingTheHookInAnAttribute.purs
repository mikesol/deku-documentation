module Examples.UsingTheHookInAnAttribute where

import Prelude
import ExampleAssitant (ExampleSignature)

import Data.String (Pattern(..), Replacement(..), replaceAll)
import Data.Tuple.Nested ((/\))
import Deku.Attribute ((:=))
import Deku.Attributes (href, klass, style)
import Deku.Control (text)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useState)
import Deku.Listeners (click)

buttonClass :: String -> String
buttonClass color =
  replaceAll (Pattern "COLOR") (Replacement color)
    """ml-4 inline-flex items-center rounded-md
border border-transparent bg-COLOR-600 px-3 py-2
text-sm font-medium leading-4 text-white shadow-sm
hover:bg-COLOR-700 focus:outline-none focus:ring-2
focus:ring-COLOR-500 focus:ring-offset-2"""

main :: ExampleSignature
main runExample = runExample Deku.do
  setHrefSwitch /\ hrefSwitch <- useState false
  setStyleSwitch /\ styleSwitch <- useState false
  D.div_
    [ D.a
        [ D.Target := "_blank"
        , href $ hrefSwitch <#>
            if _ then "https://cia.gov" else "https://fbi.gov"
        , style $ styleSwitch <#>
            if _ then "color:magenta;" else "color:teal;"
        ]
        [ text "Click me" ]
    , D.button
        [ klass $ buttonClass "indigo"
        , click $ hrefSwitch <#> not >>> setHrefSwitch
        ]
        [ text "Switch href" ]
    , D.button
        [ klass $ buttonClass "green"
        , click $ styleSwitch <#> not >>> setStyleSwitch
        ]
        [ text "Switch style" ]
    ]
