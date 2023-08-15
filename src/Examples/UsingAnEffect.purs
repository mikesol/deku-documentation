module Examples.UsingAnEffect where

import Deku.Toplevel (runInBody')
import Effect (Effect)
import Prelude
import ExampleAssitant (ExampleSignature)

import Deku.Attributes (klass_)
import Deku.Control (text_)
import Deku.DOM as D
import Deku.Attribute ((!:=))

import Web.HTML (window)
import Web.HTML.Window (alert)

app :: ExampleSignature
app runExample = runExample
  ( D.span
      [ D.OnClick !:= do
          window >>= alert "Thanks for clicking!"
      , klass_ "cursor-pointer"
      ]
      [ text_ "Click me!" ]
  )

main :: Effect Unit
main = void $ app (map (map void) runInBody')