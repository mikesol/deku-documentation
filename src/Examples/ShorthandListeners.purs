module Examples.ShorthandListeners where

import Deku.Toplevel (runInBody)
import Prelude
import ExampleAssitant (ExampleSignature)

import Deku.DOM as D
import Deku.Listeners (slider)

import Effect.Class.Console (logShow)

main :: ExampleSignature
main runExample = runExample
  (D.input (slider logShow) [])