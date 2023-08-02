module Examples.HelloWorldCode where

import Deku.Toplevel (runInBody)
import Prelude
import ExampleAssitant (ExampleSignature)

import Deku.Control (text)

main :: ExampleSignature
main runExample = runExample (text "Hello world")