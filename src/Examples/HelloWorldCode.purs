module Examples.HelloWorldCode where

import Deku.Toplevel (runInBody')
import Effect (Effect)
import Prelude
import ExampleAssitant (ExampleSignature)

import Deku.Control (text, text_)

app :: ExampleSignature
app runExample = runExample (text_ "Hello world")

main :: Effect Unit
main = void $ app (map (map void) runInBody')