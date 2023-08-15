module Examples.ShorthandListeners where

import Prelude

import Deku.DOM as D
import Deku.Listeners (slider_)
import Deku.Toplevel (runInBody')
import Effect (Effect)
import Effect.Class.Console (logShow)
import ExampleAssitant (ExampleSignature)

app :: ExampleSignature
app runExample = runExample
  (D.input [slider_ logShow] [])

main :: Effect Unit
main = void $ app (map (map void) runInBody')