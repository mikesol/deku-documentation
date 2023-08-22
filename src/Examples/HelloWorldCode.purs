module Examples.HelloWorldCode where

import Prelude
import Deku.Toplevel (runInBody')
import Effect (Effect)
import ExampleAssitant (ExampleSignature)
import Deku.Control (text_)

app :: ExampleSignature
app runExample = runExample (text_ "Hello world")

main :: Effect Unit
main = void $ app (map (map void) runInBody')