module Examples.UseDyn where

import Prelude

import Data.String (Pattern(..), Replacement(..), replaceAll)
import Data.Foldable (for_)
import Data.Tuple.Nested ((/\))
import Deku.Attribute ((!:=))
import Deku.Attributes (klass_)
import Deku.Control (text_)
import Deku.Core (dyn)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useDyn_, useHot', useState')
import Deku.Listeners (click, keyUp)
import Deku.Toplevel (runInBody)
import Effect (Effect)
import Web.Event.Event (target)
import Web.HTML (window)
import Web.HTML.HTMLInputElement (fromEventTarget, value)
import Web.HTML.Window (alert)
import Web.UIEvent.KeyboardEvent (code, toEvent)
import QualifiedDo.Alt as Alt

inputKls :: String
inputKls =
      """rounded-md
border-gray-300 shadow-sm
border-2 mr-2
border-solid
focus:border-indigo-500 focus:ring-indigo-500
sm:text-sm"""

buttonClass :: String -> String
buttonClass color =
  replaceAll (Pattern "COLOR") (Replacement color)
      """mb-3 inline-flex items-center rounded-md
border border-transparent bg-COLOR-600 px-3 py-2
text-sm font-medium leading-4 text-white shadow-sm
hover:bg-COLOR-700 focus:outline-none focus:ring-2
focus:ring-COLOR-500 focus:ring-offset-2"""

main :: Effect Unit
main = runInBody Deku.do
  setItem /\ item <- useState'
  setInput /\ input <- useHot'
  let
    guardAgainstEmpty e = do
      v <- value e
      if v == "" then
        window >>= alert "Item cannot be empty"
      else setItem v
    top =
      D.div_
        [ D.input
            Alt.do
                D.Value !:= "Tasko primo"
                keyUp $ pure \evt -> do
                    when (code evt == "Enter") $
                      for_
                        ((target >=> fromEventTarget)
                          (toEvent evt))
                        guardAgainstEmpty
                D.SelfT !:= setInput
                klass_ inputKls
            []
        , D.button
            Alt.do
              click $ input <#> guardAgainstEmpty
              klass_ $ buttonClass "green"
            [ text_ "Add" ]
        ]
  D.div_
    [ top
    , dyn $ item <#> \t -> Deku.do
        useDyn_
        D.div_ [ text_ t ]
    ]