module Examples.PassingAroundHooks where

import Prelude

import Deku.Attributes (klass_)
import Data.Tuple.Nested ((/\))
import Deku.Control (guard, text, text_)
import Deku.DOM as D
import Control.Alt ((<|>))
import Deku.Do as Deku
import Deku.Hooks (useHot, useState, useState')
import Deku.Listeners (click, click_)
import Deku.Toplevel (runInBody)
import Effect (Effect)
import FRP.Event (keepLatest)

main :: Effect Unit
main = runInBody Deku.do
  setIncrementer /\ incrementer <- useState'
  setGoodbye /\ goodbye <- useState true
  D.div_
    [ D.a
        ( klass_ "cursor-pointer" <|>
            ( click $ keepLatest $ incrementer <#>
                \{ setNumber, number } -> number <#>
                  (add 1 >>> setNumber)
            )
        )
        [ text_ "Increment" ]
    , D.div_
        [ D.a
            ( klass_ "cursor-pointer"
                <|> (click_ (setGoodbye false))
            )
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
                      ( klass_ "cursor-pointer" <|>
                          ( click_
                              (setIncrementer { setNumber, number })
                          )
                      )
                      [ text_ "Cede control" ]
                  ]
              ]
        ]
    ]