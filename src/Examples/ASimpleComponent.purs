module Examples.ASimpleComponent where

import Prelude

import Deku.Control (text)
import Deku.Core (Nut)
import Deku.DOM as D
import Deku.Toplevel (runInBody)
import Effect (Effect)

main :: Effect Unit
main = runInBody mySimpleComponent
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
          , text " "
          , D.b__ "baz"
          ]
      ]
