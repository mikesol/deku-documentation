module Examples.HelloWorldCode where

import Deku.Toplevel (runInBody)
import Prelude
import ExampleAssitant (ExampleSignature)

import Deku.Control (text)

app :: ExampleSignature
app runExample = runExample (text "Hello world")