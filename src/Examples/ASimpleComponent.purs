module Examples.ASimpleComponent where

import Deku.Toplevel (runInBody')
import Effect (Effect)
import Prelude
import ExampleAssitant (ExampleSignature)

import Deku.Control (text_)
import Deku.Core (Nut)
import Deku.DOM as D

app :: ExampleSignature
app runExample = runExample.t mySimpleComponent
  where
  -- `Nut` is the type of Deku components
  mySimpleComponent :: Nut
  mySimpleComponent =
    D.div_
      [ D.span__ "I exist"
      , D.ul_ $ map D.li__ [ "A", "B", "C" ]
      , D.div_
          [ D.h3__ "foo"
          , D.i__ "bar"
          , text_ " "
          , D.b__ "baz"
          ]
      ]

main :: Effect Unit
main = void $ app { t: map (map void) runInBody' }