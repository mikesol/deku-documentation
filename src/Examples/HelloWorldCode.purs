module Examples.HelloWorldCode where

import Prelude
import ExampleAssitant (ExampleSignature)

import Deku.Control (text)

main :: ExampleSignature
main runExample = runExample (text "Hello world")