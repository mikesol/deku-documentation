module Examples.PassingAroundHooks where

import Prelude

import Data.NonEmpty ((:|), tail)
import Data.Tuple.Nested ((/\))
import Deku.Attributes (klass)
import Deku.Control (text)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (guard, useState, useState')
import Deku.Listeners (click)
import Deku.Toplevel (runInBody)
import Effect (Effect)
import FRP.Behavior (stepNE, (>@=))

main :: Effect Unit
main = runInBody Deku.do
  setIncrementer /\ incrementer <- useState'
  setGoodbye /\ goodbye <- useState true
  D.div_
    [ D.a
        [ klass "cursor-pointer"
        , click
            $
              ( incrementer >@=
                  \{ setNumber, number } -> stepNE number <#>
                    { setNumber, n: _ }
              ) <#>
                (\{ n, setNumber } -> setNumber (1 + n))
        ]
        [ text "Increment" ]
    , D.div_
        [ D.a
            [ klass "cursor-pointer"
            , click (setGoodbye false)
            ]
            [ text "Goodbye" ]
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
                      [ klass "cursor-pointer"
                      , ( click $ number <#> \n ->
                            ( setIncrementer
                                { setNumber, number: n :| tail number }
                            )
                        )
                      ]
                      [ text "Cede control" ]
                  ]
              ]
        ]
    ]