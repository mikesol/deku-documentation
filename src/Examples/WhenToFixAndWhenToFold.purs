module Examples.WhenToFixAndWhenToFold where

import Prelude

import Data.Tuple.Nested ((/\))
import Deku.Attributes (klass_)
import Deku.Control (text_, text, (<#~>))
import Deku.Core (dyn)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useDyn_, useState')
import Deku.Listeners (click_)
import Deku.Toplevel (runInBody)
import Effect (Effect)
import FRP.Event (delay, fix, keepLatest)
import QualifiedDo.Alt as Alt

buttonClass =
  """inline-flex items-center rounded-md
border border-transparent bg-indigo-600 px-3 py-2
text-sm font-medium leading-4 text-white shadow-sm
hover:bg-indigo-700 focus:outline-none focus:ring-2
focus:ring-indigo-500 focus:ring-offset-2 mr-6""" :: String

main :: Effect Unit
main = runInBody Deku.do
  setSwitch /\ switch <- useState'
  D.div_
    [ D.div_
        [ D.button
            Alt.do
              click_ (setSwitch unit)
              klass_ buttonClass
            [ text Alt.do
                pure "Start simulation"
                switch $> "Restart simulation"
            ]
        ]
    , switch <#~> \_ -> D.div (klass_ "h-24 overflow-y-scroll")
        [ dyn
            ( fix
                ( \e -> Alt.do
                    keepLatest $ e <#> \n ->
                      (delay <*> pure)
                        if n >= 375 then 15 else n + 15
                    pure 0
                ) <#> \_ -> Deku.do
                useDyn_
                text_ "•​"
            )
        ]
    ]