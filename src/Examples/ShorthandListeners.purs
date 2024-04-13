module Examples.ShorthandListeners where

import Prelude

import Deku.DOM as D
import Deku.DOM.Attributes as DA
import Deku.DOM.Listeners as DL
import Deku.Toplevel (runInBody)
import Effect (Effect)
import Effect.Class.Console (logShow)
import ExampleAssitant (ExampleSignature)

app :: ExampleSignature
app runExample = runExample
  (D.input [ DA.xtypeRange, DL.numberOn_ DL.input logShow ] [])

main :: Effect Unit
main = void $ app $ map pure runInBody