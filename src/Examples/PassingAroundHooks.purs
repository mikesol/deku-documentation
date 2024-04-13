module Examples.PassingAroundHooks where

import Prelude

import Data.Tuple.Nested ((/\))
import Deku.DOM.Attributes as DA
import Deku.Control (text, text_)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (guard, useHot, useState, useState')
import Deku.DOM.Listeners as DL
import Deku.Toplevel (runInBody)
import Effect (Effect)
import ExampleAssitant (ExampleSignature)
import FRP.Event (keepLatest)

app :: ExampleSignature
app runExample = runExample Deku.do
  setIncrementer /\ incrementer <- useState'
  setGoodbye /\ goodbye <- useState true
  D.div_
    [ D.a
        [ DA.klass_ "cursor-pointer"
        , ( DL.runOn DL.click $ keepLatest $ incrementer <#>
              \{ setNumber, number } -> number <#>
                (add 1 >>> setNumber)
          )
        ]
        [ text_ "Increment" ]
    , D.div_
        [ D.a
            [ DA.klass_ "cursor-pointer"
            , DL.click_ \_ -> (setGoodbye false)
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
                      [ DA.klass_ "cursor-pointer"
                      , DL.click_ \_ -> setIncrementer { setNumber, number }
                      ]
                      [ text_ "Cede control" ]
                  ]
              ]
        ]
    ]

main :: Effect Unit
main = void $ app $ map pure runInBody