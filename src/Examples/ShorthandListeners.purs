module Examples.ShorthandListeners where

import Deku.Toplevel (runInBody)
import Prelude
import ExampleAssitant (ExampleSignature)

import Deku.DOM as D
import Deku.Listeners (slider)

import Effect.Class.Console (logShow)

app :: ExampleSignature
app runExample = runExample
  (D.input (slider logShow) [])