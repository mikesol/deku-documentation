module Examples.UsingAnEffect where

import Prelude

import Deku.Attributes (klass_)
import Deku.Control (text_)
import Deku.DOM as D
import Deku.Attribute ((!:=))
import Deku.Toplevel (runInBody)
import Effect (Effect)
import Web.HTML (window)
import Web.HTML.Window (alert)

main :: Effect Unit
main = runInBody
  ( D.span
      [ D.OnClick !:= do
          window >>= alert "Thanks for clicking!"
      , klass_ "cursor-pointer"
      ]
      [ text_ "Click me!" ]
  )