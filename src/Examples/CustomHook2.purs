module Examples.CustomHook2 where

import Deku.Toplevel (runInBody)
import Prelude
import ExampleAssitant (ExampleSignature)

import Assets (cruiseURL, nicholsonURL)
import Deku.Attribute ((:=))
import Deku.Control (text)
import Deku.Core (Hook)
import Deku.DOM as D
import Deku.Do as Deku

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
    [ D.p_ [ text "I want the ", D.code__ $ show r1, text "th!" ]
    , D.img [ D.Src := cruiseURL ] []
    , D.p_
        [ text "You can't handle the "
        , D.code__ $ show r2
        , text "th!"
        ]
    , D.img [ D.Src := nicholsonURL ] []
    ]