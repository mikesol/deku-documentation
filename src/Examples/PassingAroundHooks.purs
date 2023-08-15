module Examples.PassingAroundHooks where

import Prelude

import Data.Tuple.Nested ((/\))
import Deku.Attributes (klass, klass_)
import Deku.Control (text, text_)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (guard, useState, useState')
import Deku.Listeners (click, click_)
import Deku.Toplevel (runInBody')
import Effect (Effect)
import ExampleAssitant (ExampleSignature)
import FRP.Poll (stepNE, (>@=))

app :: ExampleSignature
app runExample = runExample Deku.do
  setIncrementer /\ incrementer <- useState'
  setGoodbye /\ goodbye <- useState true
  D.div_
    [ D.a
        [ klass_ "cursor-pointer"
        , click
            $
              ( incrementer >@=
                  \{ setNumber, number } -> stepNE number <#>
                    { setNumber, n: _ }
              ) <#>
                (\{ n, setNumber } -> setNumber (1 + n))
        ]
        [ text_ "Increment" ]
    , D.div_
        [ D.a
            [ klass_ "cursor-pointer"
            , click (setGoodbye false)
            ]
            [ text_ "Goodbye" ]
        ]
    , D.div_
        [ guard goodbye Deku.do
            setNumber /\ number <- useState 0
            D.div_
              [ D.div_
                  [ text (number <#> show >>> ("n = " <> _))
                  ]
              , D.div_
                  [ D.a
                      [ klass_ "cursor-pointer"
                      , ( click $ number <#> \n ->
                            ( setIncrementer
                                { setNumber, number: rehead n number }
                            )
                        )
                      ]
                      [ text_ "Cede control" ]
                  ]
              ]
        ]
    ]

main :: Effect Unit
main = void $ app (map (map void) runInBody')