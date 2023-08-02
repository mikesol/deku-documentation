module Examples.UsingAnEffect where

import Deku.Toplevel (runInBody)
import Prelude
import ExampleAssitant (ExampleSignature)

import Deku.Attributes (klass)
import Deku.Control (text)
import Deku.DOM as D
import Deku.Attribute ((:=))

import Web.HTML (window)
import Web.HTML.Window (alert)

app :: ExampleSignature
app runExample = runExample
  ( D.span
      [ D.OnClick := do
          window >>= alert "Thanks for clicking!"
      , klass "cursor-pointer"
      ]
      [ text "Click me!" ]
  )