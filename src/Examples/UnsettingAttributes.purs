module Examples.UnsettingAttributes where

import Prelude

import Data.String (Pattern(..), Replacement(..), replaceAll)
import Data.Tuple.Nested ((/\))
import Deku.Attribute ((!:=), (:=))
import Deku.Attributes (klass_)
import Deku.Control (text_)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useState)
import Deku.Listeners (click)
import Deku.Toplevel (runInBody)
import Effect (Effect)
import QualifiedDo.Alt as Alt

buttonClass :: String -> String
buttonClass color =
  replaceAll (Pattern "COLOR") (Replacement color)
    """ml-4 inline-flex items-center rounded-md
border border-transparent bg-COLOR-600 px-3 py-2
text-sm font-medium leading-4 text-white shadow-sm
hover:bg-COLOR-700 focus:outline-none focus:ring-2
focus:ring-COLOR-500 focus:ring-offset-2"""

main :: Effect Unit
main = runInBody Deku.do
  setStyleSwitch /\ styleSwitch <- useState false
  D.div_
    [ D.a
        Alt.do
          D.Target !:= "_blank"
          styleSwitch <#>
            if _ then D.Style := "color:magenta;"
            else D.Style := unit
        [ text_ "Click me" ]
    , D.button
        Alt.do
          klass_ $ buttonClass "pink"
          click $ styleSwitch <#> not >>> setStyleSwitch
        [ text_ "Switch style" ]
    ]