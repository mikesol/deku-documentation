module Examples.CustomHook2 where

import Prelude

import Assets (cruiseURL, nicholsonURL)
import Deku.Control (text_)
import Deku.Core (Hook)
import Deku.DOM as D
import Deku.DOM.Attributes as DA
import Deku.Do as Deku
import Deku.Toplevel (runInBody)
import Effect (Effect)
import ExampleAssitant (ExampleSignature)

app :: ExampleSignature
app runExample = runExample Deku.do
  let
    hook1 :: Hook Boolean
    hook1 cruise = cruise true

    hook2 :: Hook Boolean
    hook2 nicholson = nicholson true
  r1 <- hook1
  r2 <- hook2
  D.div_
    [ D.p_ [ text_ "I want the ", D.code__ $ show r1, text_ "th!" ]
    , D.img
        [ DA.alt_ "A picture of Tom Cruise in A Few Good Men"
        , DA.src_ cruiseURL
        ]
        []
    , D.p_
        [ text_ "You can't handle the "
        , D.code__ $ show r2
        , text_ "th!"
        ]
    , D.img
        [ DA.alt_ "A picture of Jack Nicholson in A Few Good Men"
        , DA.src_ nicholsonURL
        ]
        []
    ]

main :: Effect Unit
main = void $ app runInBody