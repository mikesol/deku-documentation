module Examples.WhenToFixAndWhenToFold where

import Prelude

import Control.Alt ((<|>))
import Data.Either (hush)
import Data.Filterable (filterMap)
import Data.Tuple (snd)
import Data.Tuple.Nested ((/\))
import Deku.DOM.Attributes as DA
import Deku.Control (text, text_)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useDynAtBeginning, useState', (<#~>))
import Deku.DOM.Listeners as DL
import Deku.Toplevel (runInBody')
import Effect (Effect)
import ExampleAssitant (ExampleSignature)
import FRP.Event (delay)
import FRP.Event.Class (fix, keepLatest)
import FRP.Poll (dredge)
import QualifiedDo.Alt as Alt

buttonClass =
  """inline-flex items-center rounded-md
border border-transparent bg-indigo-600 px-3 py-2
text-sm font-medium leading-4 text-white shadow-sm
hover:bg-indigo-700 focus:outline-none focus:ring-2
focus:ring-indigo-500 focus:ring-offset-2 mr-6""" :: String

app :: ExampleSignature
app runExample = runExample.t Deku.do
  setSwitch /\ switch <- useState'
  D.div_
    [ D.div_
        [ D.button
            [ DL.click_ \_ -> (setSwitch unit)
            , DA.klass_ buttonClass
            ]
            [ text
                (pure "Start simulation" <|> (switch $> "Restart simulation"))
            ]
        ]
    , switch <#~> \_ -> D.div [ DA.klass_ "h-24 overflow-y-scroll" ]
        [ Deku.do
            _ <- useDynAtBeginning
              ( fix
                  ( \e -> Alt.do
                      keepLatest $ e <#> \n -> do
                        let t = if n >= 375 then 15 else n + 15
                        filterMap (hush >>> map snd) $ dredge (delay t)
                          (pure t)
                      pure 0
                  )
              )
            text_ "•​"
        ]
    ]

main :: Effect Unit
main = void $ app { t: map (map void) runInBody' }