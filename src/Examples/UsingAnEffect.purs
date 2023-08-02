module Examples.UsingAnEffect where

import Prelude

import Deku.Attributes (klass)
import Deku.Control (text)
import Deku.DOM as D
import Deku.Attribute ((:=))
import Deku.Toplevel (runInBody)
import Effect (Effect)
import Web.HTML (window)
import Web.HTML.Window (alert)

main :: Effect Unit
main = runInBody
  ( D.span
      [ D.OnClick := do
          window >>= alert "Thanks for clicking!"
      , klass "cursor-pointer"
      ]
      [ text "Click me!" ]
  )