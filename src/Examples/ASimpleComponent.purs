module Examples.ASimpleComponent where

import Prelude

import Deku.Control (text_)
import Deku.Core (Nut)
import Deku.DOM as D
import Deku.Toplevel (runInBody)
import Effect (Effect)

main :: Effect Unit
main = runInBody mySimpleComponent
  where
  -- `Nut` is a convenience alias for the type for components
  -- type Nut = forall lock payload. Domable lock payload
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
