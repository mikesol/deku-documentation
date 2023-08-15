module Examples.WhenToFixAndWhenToFold where

import Prelude

import Control.Alt ((<|>))
import Data.Either (hush)
import Data.Filterable (filterMap)
import Data.Tuple (snd)
import Data.Tuple.Nested ((/\))
import Deku.Attributes (klass_)
import Deku.Control (text, text_)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useDynAtBeginning, useState', (<#~>))
import Deku.Listeners (click_)
import Deku.Toplevel (runInBody')
import Effect (Effect)
import ExampleAssitant (ExampleSignature)
import FRP.Event (delay)
import FRP.Event.Class (fix, keepLatest, once)
import FRP.Poll (dredge)
import QualifiedDo.Alt as Alt

buttonClass =
  """inline-flex items-center rounded-md
border border-transparent bg-indigo-600 px-3 py-2
text-sm font-medium leading-4 text-white shadow-sm
hover:bg-indigo-700 focus:outline-none focus:ring-2
focus:ring-indigo-500 focus:ring-offset-2 mr-6""" :: String

app :: ExampleSignature
app runExample = runExample Deku.do
  setSwitch /\ switch <- useState'
  D.div_
    [ D.div_
        [ D.button
            [ click_ (setSwitch unit)
            , klass_ buttonClass
            ]
            [ text
                (pure "Start simulation" <|> (switch $> "Restart simulation"))
            ]
        ]
    , switch <#~> \_ -> D.div [ klass_ "h-24 overflow-y-scroll" ]
        [ Deku.do
            _ <- useDynAtBeginning
              ( fix
                  ( \e -> Alt.do
                      keepLatest $ e <#> \n -> do
                        let t = if n >= 375 then 15 else n + 15
                        filterMap (hush >>> map snd) $ dredge (delay t)
                          (once switch $> t)
                      once switch $> 0
                  )
              )
            text_ "•​"
        ]
    ]

main :: Effect Unit
main = void $ app (map (map void) runInBody')