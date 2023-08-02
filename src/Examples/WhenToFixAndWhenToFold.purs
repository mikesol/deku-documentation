module Examples.WhenToFixAndWhenToFold where

import Prelude
import ExampleAssitant (ExampleSignature)

import Data.Either (hush)
import Data.NonEmpty ((:|))
import Data.Tuple (snd)
import Data.Tuple.Nested ((/\))
import Deku.Attributes (klass)
import Deku.Control (text)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useDynAtBeginning_, useState', (<#~>))
import Deku.Listeners (click)

import FRP.Event (delay, filterMap, fix, keepLatest, once)
import QualifiedDo.Alt as Alt

buttonClass =
  """inline-flex items-center rounded-md
border border-transparent bg-indigo-600 px-3 py-2
text-sm font-medium leading-4 text-white shadow-sm
hover:bg-indigo-700 focus:outline-none focus:ring-2
focus:ring-indigo-500 focus:ring-offset-2 mr-6""" :: String

main :: ExampleSignature
main runExample = runExample Deku.do
  setSwitch /\ switch <- useState'
  D.div_
    [ D.div_
        [ D.button
            [ click (setSwitch unit)
            , klass buttonClass
            ]
            [ text $ "Start simulation" :| (switch $> "Restart simulation")
            ]
        ]
    , switch <#~> \_ -> D.div [ klass "h-24 overflow-y-scroll" ]
        [ Deku.do
            _ <- useDynAtBeginning_
              ( fix
                  ( \e -> Alt.do
                      keepLatest $ e <#> \n -> do
                        let t = if n >= 375 then 15 else n + 15
                        filterMap (hush >>> map snd) $ delay t
                          (once switch $> t)
                      once switch $> 0
                  )
              )
            text "•​"
        ]
    ]