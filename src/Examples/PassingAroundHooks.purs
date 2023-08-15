module Examples.PassingAroundHooks where

import Prelude

import Data.Tuple.Nested ((/\))
import Deku.Attributes (klass_)
import Deku.Control (text, text_)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (guard, useHot, useState, useState')
import Deku.Listeners (click, click_)
import Deku.Toplevel (runInBody')
import Effect (Effect)
import ExampleAssitant (ExampleSignature)
import FRP.Event (keepLatest)

app :: ExampleSignature
app runExample = runExample Deku.do
  setIncrementer /\ incrementer <- useState'
  setGoodbye /\ goodbye <- useState true
  D.div_
    [ D.a
        [ klass_ "cursor-pointer"
        , ( click $ keepLatest $ incrementer <#>
              \{ setNumber, number } -> number <#>
                (add 1 >>> setNumber)
          )
        ]
        [ text_ "Increment" ]
    , D.div_
        [ D.a
            [ klass_ "cursor-pointer"
            , click_ (setGoodbye false)
            ]
            [ text_ "Goodbye" ]
        ]
    , D.div_
        [ guard goodbye Deku.do
            setNumber /\ number <- useHot 0
            D.div_
              [ D.div_
                  [ text (number <#> show >>> ("n = " <> _))
                  ]
              , D.div_
                  [ D.a
                      [ klass_ "cursor-pointer"
                      , ( click_
                            (setIncrementer { setNumber, number })
                        )
                      ]
                      [ text_ "Cede control" ]
                  ]
              ]
        ]
    ]

main :: Effect Unit
main = void $ app (map (map void) runInBody')